// Models for Program Data Structure

class Speaker {
  final String id;
  final String name;
  final String title;
  final String? affiliation;
  final String? imageUrl;

  Speaker({
    required this.id,
    required this.name,
    required this.title,
    this.affiliation,
    this.imageUrl,
  });

  factory Speaker.fromMap(Map<String, dynamic> map) {
    return Speaker(
      id: map['id']?.toString() ?? '',
      name: map['name']?.toString() ?? '',
      title: map['title']?.toString() ?? '',
      affiliation: map['affiliation']?.toString(),
      imageUrl: map['imageUrl']?.toString(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'title': title,
      'affiliation': affiliation,
      'imageUrl': imageUrl,
    };
  }
}

class Topic {
  final String id;
  final String title;
  final String? description;
  final String startTime;
  final String endTime;
  final List<Speaker> speakers;
  final String? location;

  Topic({
    required this.id,
    required this.title,
    this.description,
    required this.startTime,
    required this.endTime,
    required this.speakers,
    this.location,
  });

  factory Topic.fromMap(Map<String, dynamic> map) {
    return Topic(
      id: map['id']?.toString() ?? '',
      title: map['title']?.toString() ?? '',
      description: map['description']?.toString(),
      startTime: map['startTime']?.toString() ?? '',
      endTime: map['endTime']?.toString() ?? '',
      speakers: (map['speakers'] as List<dynamic>?)
              ?.map((s) => Speaker.fromMap(s as Map<String, dynamic>))
              .toList() ??
          [],
      location: map['location']?.toString(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'startTime': startTime,
      'endTime': endTime,
      'speakers': speakers.map((s) => s.toMap()).toList(),
      'location': location,
    };
  }
}

class Session {
  final String id;
  final String title;
  final String type; // 'session', 'break', 'opening', 'closing', 'workshop'
  final String startTime;
  final String endTime;
  final String? location;
  final String? description;
  final List<Topic> topics;
  final String? chairperson;

  Session({
    required this.id,
    required this.title,
    required this.type,
    required this.startTime,
    required this.endTime,
    this.location,
    this.description,
    required this.topics,
    this.chairperson,
  });

  factory Session.fromMap(Map<String, dynamic> map) {
    return Session(
      id: map['id']?.toString() ?? '',
      title: map['title']?.toString() ?? '',
      type: map['type']?.toString() ?? 'session',
      startTime: map['startTime']?.toString() ?? '',
      endTime: map['endTime']?.toString() ?? '',
      location: map['location']?.toString(),
      description: map['description']?.toString(),
      topics: (map['topics'] as List<dynamic>?)
              ?.map((t) => Topic.fromMap(t as Map<String, dynamic>))
              .toList() ??
          [],
      chairperson: map['chairperson']?.toString(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'type': type,
      'startTime': startTime,
      'endTime': endTime,
      'location': location,
      'description': description,
      'topics': topics.map((t) => t.toMap()).toList(),
      'chairperson': chairperson,
    };
  }
}

class ConferenceDay {
  final String id;
  final String date;
  final String dayNumber;
  final String title;
  final List<Session> sessions;

  ConferenceDay({
    required this.id,
    required this.date,
    required this.dayNumber,
    required this.title,
    required this.sessions,
  });

  factory ConferenceDay.fromMap(Map<String, dynamic> map) {
    return ConferenceDay(
      id: map['id']?.toString() ?? '',
      date: map['date']?.toString() ?? '',
      dayNumber: map['dayNumber']?.toString() ?? '',
      title: map['title']?.toString() ?? '',
      sessions: (map['sessions'] as List<dynamic>?)
              ?.map((s) => Session.fromMap(s as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'dayNumber': dayNumber,
      'title': title,
      'sessions': sessions.map((s) => s.toMap()).toList(),
    };
  }
}

class Bookmark {
  final String id;
  final String type; // 'session' or 'topic'
  final String itemId;
  final String title;
  final String date;
  final String time;
  final DateTime createdAt;

  Bookmark({
    required this.id,
    required this.type,
    required this.itemId,
    required this.title,
    required this.date,
    required this.time,
    required this.createdAt,
  });

  factory Bookmark.fromMap(Map<String, dynamic> map) {
    return Bookmark(
      id: map['id']?.toString() ?? '',
      type: map['type']?.toString() ?? '',
      itemId: map['itemId']?.toString() ?? '',
      title: map['title']?.toString() ?? '',
      date: map['date']?.toString() ?? '',
      time: map['time']?.toString() ?? '',
      createdAt: DateTime.parse(map['createdAt']?.toString() ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'itemId': itemId,
      'title': title,
      'date': date,
      'time': time,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}