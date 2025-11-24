import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../config/theme/text_styles.dart';
import '../../../models/program_models.dart';
import '../../../providers/bookmark_provider.dart';
import '../../../services/google_sheets_service.dart';
import 'session_detail_screen.dart';

class ProgramScreen extends StatefulWidget {
  const ProgramScreen({super.key});

  @override
  State<ProgramScreen> createState() => _ProgramScreenState();
}

class _ProgramScreenState extends State<ProgramScreen> with SingleTickerProviderStateMixin {
  static const Color primaryPurple = Color(0xFF3D2B5C);
  static const Color lightBeige = Color(0xFFF5E6D3);
  static const Color accentPurple = Color(0xFF6B5189);
  static const Color darkText = Color(0xFF2C1B3D);
  static const Color whiteColor = Colors.white;

  List<ConferenceDay> _conferenceDays = [];
  List<ConferenceDay> _filteredDays = [];
  bool _isLoading = true;
  String? _error;
  
  final TextEditingController _searchController = TextEditingController();
  TabController? _tabController;
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _loadProgram();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _tabController?.dispose();
    super.dispose();
  }

  Future<void> _loadProgram() async {
    try {
      setState(() {
        _isLoading = true;
        _error = null;
      });

      final service = CustomGoogleSheetsProgramService(
        sheetUrl: 'https://docs.google.com/spreadsheets/d/e/2PACX-1vT4grmVJdLyONJlxyMb6FhnmHX9GnenRHPsqoDhheLeyKR7mgsf7rMdWuNShQt68ZOnzqJuaVSk1pOT/pub?output=csv',
      );
      
      final days = await service.loadProgramFromGoogleSheets();
      _tabController = TabController(length: days.length, vsync: this);

      setState(() {
        _conferenceDays = days;
        _filteredDays = days;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = 'Failed to load program: $e';
        _isLoading = false;
      });
      _loadSampleData();
    }
  }

  void _loadSampleData() {
    setState(() {
      _conferenceDays = [
        ConferenceDay(
          id: 'day1',
          date: 'December 3, 2025',
          dayNumber: 'Day 1',
          title: 'Pre-Conference Workshops',
          sessions: [
            Session(
              id: 'session1',
              title: 'Registration & Welcome Coffee',
              type: 'break',
              startTime: '08:00',
              endTime: '09:00',
              location: 'Main Lobby',
              description: 'Registration and morning refreshments',
              topics: [],
            ),
          ],
        ),
        ConferenceDay(
          id: 'day2',
          date: 'December 4, 2025',
          dayNumber: 'Day 2',
          title: 'Main Conference Day',
          sessions: [],
        ),
        ConferenceDay(
          id: 'day3',
          date: 'December 5, 2025',
          dayNumber: 'Day 3',
          title: 'Final Day',
          sessions: [],
        ),
      ];
      _filteredDays = _conferenceDays;
      _tabController = TabController(length: _conferenceDays.length, vsync: this);
      _isLoading = false;
    });
  }

  void _filterProgram(String query) {
    if (query.isEmpty) {
      setState(() {
        _filteredDays = _conferenceDays;
      });
      return;
    }

    final lowerQuery = query.toLowerCase();
    final filtered = <ConferenceDay>[];

    for (var day in _conferenceDays) {
      final filteredSessions = <Session>[];

      for (var session in day.sessions) {
        bool matches = session.title.toLowerCase().contains(lowerQuery) ||
            (session.chairperson?.toLowerCase().contains(lowerQuery) ?? false);
        
        for (var topic in session.topics) {
          if (topic.title.toLowerCase().contains(lowerQuery)) matches = true;
          for (var speaker in topic.speakers) {
            if (speaker.name.toLowerCase().contains(lowerQuery)) matches = true;
          }
        }

        if (matches) filteredSessions.add(session);
      }

      if (filteredSessions.isNotEmpty) {
        filtered.add(ConferenceDay(
          id: day.id,
          date: day.date,
          dayNumber: day.dayNumber,
          title: day.title,
          sessions: filteredSessions,
        ));
      }
    }

    setState(() {
      _filteredDays = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBeige,
      appBar: AppBar(
        title: _isSearching
            ? TextField(
                controller: _searchController,
                autofocus: true,
                style: const TextStyle(color: whiteColor),
                decoration: InputDecoration(
                  hintText: 'Search sessions, topics, speakers...',
                  hintStyle: TextStyle(color: whiteColor.withOpacity(0.7)),
                  border: InputBorder.none,
                ),
                onChanged: _filterProgram,
              )
            : const Text('Conference Program'),
        centerTitle: !_isSearching,
        backgroundColor: primaryPurple,
        foregroundColor: whiteColor,
        actions: [
          IconButton(
            icon: Icon(_isSearching ? Icons.close : Icons.search),
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
                if (!_isSearching) {
                  _searchController.clear();
                  _filterProgram('');
                }
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.bookmark_rounded),
            onPressed: () {
              Navigator.pushNamed(context, '/bookmarks');
            },
          ),
        ],
        bottom: !_isLoading && _tabController != null && !_isSearching
            ? TabBar(
                controller: _tabController,
                labelColor: whiteColor,
                unselectedLabelColor: whiteColor.withOpacity(0.6),
                indicatorColor: whiteColor,
                tabs: _conferenceDays.map((day) {
                  return Tab(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(day.dayNumber, style: const TextStyle(fontWeight: FontWeight.bold)),
                        Text(_extractDate(day.date), style: const TextStyle(fontSize: 10)),
                      ],
                    ),
                  );
                }).toList(),
              )
            : null,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? _buildErrorView()
              : _isSearching
                  ? _buildSearchResults()
                  : _buildTabbedContent(),
    );
  }

  String _extractDate(String fullDate) {
    final parts = fullDate.split(' ');
    if (parts.length >= 2) {
      return '${parts[0].substring(0, 3)} ${parts[1].replaceAll(',', '')}';
    }
    return fullDate;
  }

  Widget _buildSearchResults() {
    if (_filteredDays.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search_off, size: 64, color: accentPurple.withOpacity(0.5)),
            const SizedBox(height: 16),
            Text('No results found', style: AppTextStyles.h4.copyWith(color: darkText)),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _filteredDays.length,
      itemBuilder: (context, i) => Column(
        children: [
          _buildDayCard(_filteredDays[i]),
          if (i < _filteredDays.length - 1) const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildTabbedContent() {
    return TabBarView(
      controller: _tabController,
      children: _conferenceDays.map((day) => _buildDayContent(day)).toList(),
    );
  }

  Widget _buildDayContent(ConferenceDay day) {
    if (day.sessions.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.event_busy, size: 64, color: accentPurple.withOpacity(0.5)),
            const SizedBox(height: 16),
            Text('No sessions scheduled', style: AppTextStyles.h4.copyWith(color: darkText)),
            Text('for ${day.dayNumber}', style: AppTextStyles.bodySmall.copyWith(color: accentPurple)),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: day.sessions.length,
      itemBuilder: (context, i) => Column(
        children: [
          _buildSessionCard(day.sessions[i], day.date),
          if (i < day.sessions.length - 1) const SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget _buildErrorView() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64, color: accentPurple),
            const SizedBox(height: 16),
            Text('Error Loading Program', style: AppTextStyles.h4.copyWith(color: darkText)),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _loadProgram,
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryPurple,
                foregroundColor: whiteColor,
              ),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDayCard(ConferenceDay day) {
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: primaryPurple.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [primaryPurple, accentPurple]),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: whiteColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.calendar_today, color: whiteColor, size: 24),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(day.dayNumber, style: AppTextStyles.h4.copyWith(color: whiteColor, fontWeight: FontWeight.bold)),
                      Text(day.date, style: AppTextStyles.bodySmall.copyWith(color: whiteColor.withOpacity(0.9))),
                      if (day.title.isNotEmpty)
                        Text(day.title, style: AppTextStyles.caption.copyWith(color: whiteColor.withOpacity(0.8))),
                    ],
                  ),
                ),
                Text('${day.sessions.length} Sessions', style: AppTextStyles.caption.copyWith(color: whiteColor.withOpacity(0.9))),
              ],
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16),
            itemCount: day.sessions.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, i) => _buildSessionCard(day.sessions[i], day.date),
          ),
        ],
      ),
    );
  }

  Widget _buildSessionCard(Session session, String date) {
    final bookmarkProvider = Provider.of<BookmarkProvider>(context);
    final isBookmarked = bookmarkProvider.isBookmarked(session.id);
    Color sessionColor = _getSessionColor(session.type);
    IconData sessionIcon = _getSessionIcon(session.type);

    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SessionDetailScreen(session: session, date: date))),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: sessionColor.withOpacity(0.05),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: sessionColor.withOpacity(0.2)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: sessionColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(sessionIcon, color: sessionColor, size: 20),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(session.title, style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.bold, color: darkText)),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.access_time, size: 14, color: accentPurple),
                          const SizedBox(width: 4),
                          Text('${session.startTime} - ${session.endTime}', style: AppTextStyles.caption.copyWith(color: accentPurple)),
                          if (session.location != null) ...[
                            const SizedBox(width: 12),
                            Icon(Icons.location_on, size: 14, color: accentPurple),
                            const SizedBox(width: 4),
                            Expanded(child: Text(session.location!, style: AppTextStyles.caption.copyWith(color: accentPurple), overflow: TextOverflow.ellipsis)),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(isBookmarked ? Icons.bookmark : Icons.bookmark_border, color: isBookmarked ? primaryPurple : accentPurple),
                  onPressed: () {
                    bookmarkProvider.toggleBookmark(
                      itemId: session.id,
                      type: 'session',
                      title: session.title,
                      date: date,
                      time: '${session.startTime} - ${session.endTime}',
                    );
                  },
                ),
              ],
            ),
            if (session.chairperson != null) ...[
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: sessionColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.person, size: 14, color: sessionColor),
                    const SizedBox(width: 4),
                    Text('Chair: ${session.chairperson}', style: AppTextStyles.caption.copyWith(color: sessionColor, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            ],
            if (session.topics.isNotEmpty) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: [
                    Icon(Icons.topic, size: 16, color: sessionColor),
                    const SizedBox(width: 6),
                    Text('${session.topics.length} Topic${session.topics.length > 1 ? 's' : ''}', style: AppTextStyles.caption.copyWith(color: darkText, fontWeight: FontWeight.w600)),
                    const Spacer(),
                    Icon(Icons.arrow_forward_ios, size: 12, color: sessionColor),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Color _getSessionColor(String type) {
    switch (type.toLowerCase()) {
      case 'opening':
      case 'closing':
        return const Color(0xFFD4AF37);
      case 'break':
        return accentPurple;
      case 'workshop':
        return const Color(0xFF4CAF50);
      default:
        return primaryPurple;
    }
  }

  IconData _getSessionIcon(String type) {
    switch (type.toLowerCase()) {
      case 'opening':
        return Icons.celebration;
      case 'closing':
        return Icons.emoji_events;
      case 'break':
        return Icons.coffee;
      case 'workshop':
        return Icons.handyman;
      default:
        return Icons.event_note;
    }
  }
}