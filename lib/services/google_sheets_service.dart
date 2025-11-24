import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/program_models.dart';

class CustomGoogleSheetsProgramService {
  /// Your Google Sheet URL (published as CSV)
  /// Go to: File → Share → Publish to web
  /// Choose: Entire document → CSV format
  final String sheetUrl;

  CustomGoogleSheetsProgramService({required this.sheetUrl});

  /// Load program from your custom format Google Sheet
  Future<List<ConferenceDay>> loadProgramFromGoogleSheets() async {
    try {
      print('Loading from Google Sheets...');
      
      // Fetch sheet data
      final response = await http.get(Uri.parse(sheetUrl));
      
      if (response.statusCode != 200) {
        throw Exception('Failed to load sheet: ${response.statusCode}');
      }

      // Parse CSV
      final lines = response.body.split('\n');
      final rows = <List<String>>[];
      
      for (var line in lines) {
        if (line.trim().isEmpty) continue;
        // Parse CSV (handle commas in quotes)
        final row = _parseCSVLine(line);
        rows.add(row);
      }

      if (rows.length < 2) {
        throw Exception('Sheet is empty or has no data rows');
      }

      // Skip header row and process data
      return _processSheetData(rows.sublist(1));
    } catch (e) {
      print('Error loading from Google Sheets: $e');
      return [];
    }
  }

  List<String> _parseCSVLine(String line) {
    final result = <String>[];
    var current = '';
    var inQuotes = false;

    for (var i = 0; i < line.length; i++) {
      final char = line[i];

      if (char == '"') {
        inQuotes = !inQuotes;
      } else if (char == ',' && !inQuotes) {
        result.add(current.trim());
        current = '';
      } else {
        current += char;
      }
    }
    result.add(current.trim());

    return result;
  }

  List<ConferenceDay> _processSheetData(List<List<String>> rows) {
    // Group by day
    final Map<String, List<List<String>>> dayGroups = {};
    
    for (var row in rows) {
      if (row.isEmpty) continue;
      
      final day = row.length > 0 ? row[0] : '';
      if (day.isEmpty) continue;
      
      if (!dayGroups.containsKey(day)) {
        dayGroups[day] = [];
      }
      dayGroups[day]!.add(row);
    }

    // Convert to ConferenceDay objects
    final days = <ConferenceDay>[];
    
    for (var entry in dayGroups.entries) {
      final dayString = entry.key;
      final dayRows = entry.value;
      
      // Parse day info (e.g., "2025-11-12" or "Day1")
      final dayNumber = _extractDayNumber(dayString);
      final date = _formatDate(dayString);
      
      // Group by session
      final sessions = _groupIntoSessions(dayRows);
      
      days.add(ConferenceDay(
        id: 'day_${dayString.replaceAll('-', '_')}',
        date: date,
        dayNumber: dayNumber,
        title: '', // You can add this if needed
        sessions: sessions,
      ));
    }

    return days;
  }

  String _extractDayNumber(String dayString) {
    // Extract "Day 1" from "2025-11-12" or similar
    if (dayString.contains('Day')) return dayString;
    // Otherwise, assign Day 1, Day 2, etc. based on date
    return 'Day ${dayString.split('-').last}';
  }

  String _formatDate(String dayString) {
    // If it's already a date like "2025-11-12", format it nicely
    if (dayString.contains('-')) {
      final parts = dayString.split('-');
      if (parts.length == 3) {
        final months = ['', 'January', 'February', 'March', 'April', 'May', 'June',
                        'July', 'August', 'September', 'October', 'November', 'December'];
        final month = int.tryParse(parts[1]) ?? 0;
        final day = parts[2];
        final year = parts[0];
        return '${months[month]} $day, $year';
      }
    }
    return dayString;
  }

  List<Session> _groupIntoSessions(List<List<String>> rows) {
    final Map<String, List<List<String>>> sessionGroups = {};
    
    for (var row in rows) {
      final sessionId = row.length > 1 ? row[1] : '';
      if (sessionId.isEmpty) continue;
      
      if (!sessionGroups.containsKey(sessionId)) {
        sessionGroups[sessionId] = [];
      }
      sessionGroups[sessionId]!.add(row);
    }

    final sessions = <Session>[];
    
    for (var entry in sessionGroups.entries) {
      final sessionId = entry.key;
      final sessionRows = entry.value;
      
      if (sessionRows.isEmpty) continue;
      
      // First row has session info
      final firstRow = sessionRows[0];
      
      final sessionTitle = firstRow.length > 2 ? firstRow[2] : '';
      final hall = firstRow.length > 3 ? firstRow[3] : '';
      final sessionStart = firstRow.length > 4 ? firstRow[4] : '';
      final sessionEnd = firstRow.length > 5 ? firstRow[5] : '';
      
      // Determine session type from title
      final type = _determineSessionType(sessionTitle);
      
      // Group topics
      final topics = _groupIntoTopics(sessionRows);
      
      sessions.add(Session(
        id: sessionId,
        title: sessionTitle,
        type: type,
        startTime: sessionStart,
        endTime: sessionEnd,
        location: hall,
        description: '',
        chairperson: null,
        topics: topics,
      ));
    }

    return sessions;
  }

  String _determineSessionType(String title) {
    final lowerTitle = title.toLowerCase();
    
    if (lowerTitle.contains('opening')) return 'opening';
    if (lowerTitle.contains('closing')) return 'closing';
    if (lowerTitle.contains('coffee') || lowerTitle.contains('break') || 
        lowerTitle.contains('lunch')) return 'break';
    if (lowerTitle.contains('workshop') || lowerTitle.contains('working group')) return 'workshop';
    
    return 'session';
  }

  List<Topic> _groupIntoTopics(List<List<String>> rows) {
    final topics = <Topic>[];
    
    for (var row in rows) {
      final topicId = row.length > 6 ? row[6] : '';
      final topicTitle = row.length > 7 ? row[7] : '';
      final speaker = row.length > 8 ? row[8] : '';
      final topicStart = row.length > 9 ? row[9] : '';
      final topicEnd = row.length > 10 ? row[10] : '';
      
      if (topicId.isEmpty || topicTitle.isEmpty) continue;
      
      // Check if topic already exists (same topicId)
      final existingTopic = topics.where((t) => t.id == topicId).firstOrNull;
      
      if (existingTopic != null) {
        // Add speaker to existing topic
        if (speaker.isNotEmpty) {
          final newSpeaker = Speaker(
            id: 'speaker_${topicId}_${existingTopic.speakers.length}',
            name: speaker,
            title: '',
            affiliation: null,
            imageUrl: null,
          );
          existingTopic.speakers.add(newSpeaker);
        }
      } else {
        // Create new topic
        final speakers = <Speaker>[];
        
        if (speaker.isNotEmpty) {
          speakers.add(Speaker(
            id: 'speaker_${topicId}_0',
            name: speaker,
            title: '',
            affiliation: null,
            imageUrl: null,
          ));
        }
        
        topics.add(Topic(
          id: topicId,
          title: topicTitle,
          description: null,
          startTime: topicStart,
          endTime: topicEnd,
          location: null,
          speakers: speakers,
        ));
      }
    }

    return topics;
  }
}