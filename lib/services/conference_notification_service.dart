// Add these to your pubspec.yaml dependencies:
// flutter_local_notifications: ^17.0.0
// timezone: ^0.9.0
// permission_handler: ^11.0.0

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConferenceNotificationService {
  static final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();

// //THIS for testingg automatically
// static Future<void> scheduleImmediateTestNotification() async {
//   final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

//   await flutterLocalNotificationsPlugin.zonedSchedule(
//     999, // unique ID
//     'Test Notification',
//     'This notification fired after 20 seconds!',
//     tz.TZDateTime.now(tz.local).add(const Duration(seconds: 20)),
//     const NotificationDetails(
//       android: AndroidNotificationDetails(
//         'conference_channel',
//         'Conference Notifications',
//         channelDescription: 'Test notifications for the app',
//         importance: Importance.max,
//         priority: Priority.high,
//       ),
//       iOS: DarwinNotificationDetails(),
//     ),
//     androidAllowWhileIdle: true,
//     uiLocalNotificationDateInterpretation:
//         UILocalNotificationDateInterpretation.absoluteTime,
//     payload: 'test',
//   );
// }


  // Conference schedule configuration - UPDATE THESE DATES!
  static final List<ConferenceDay> conferenceDays = [
    ConferenceDay(
      day: 1,
      date: DateTime(2025, 12, 3), // Change to your actual date
      morningMessage: "🌟 Welcome to ESSB & PATS Congress Day 1!Registration starts at 9:00 to 9:30 AM,be on time",
      eveningMessage: "Great job today! Rest well for tomorrow's sessions.",
      breaks: [
        Break(time: TimeOfDay(hour: 13, minute: 00), message: "☕ Coffee break time! Network with fellow attendees."),
        Break(time: TimeOfDay(hour: 17, minute: 30), message: "🍽️ It's lunch time Enjoy your meal and discussions."),
        // Break(time: TimeOfDay(hour: 15, minute: 30), message: "☕ Afternoon break! Refresh and recharge."),
      ],
    ),
    ConferenceDay(
      day: 2,
      date: DateTime(2025, 12, 4), // Change to your actual date
      morningMessage: "🚀 Day 2 is here Registration starts at 8:30 AM, Ready for more insights and networking?",
      eveningMessage: "Another productive day! See you tomorrow for the finale.",
      breaks: [
        Break(time: TimeOfDay(hour: 12, minute: 00), message: "Something big is coming up!!!,grab your coffee and get ready for ESSB & PATS Congress Opening Ceremony."),
      ],
    ),
    ConferenceDay(
      day: 3,
      date: DateTime(2025, 12, 5), // Change to your actual date
      morningMessage: "🎯Let's finish strong and make lasting connections!,Registration starts at 8:30 AM.",
      eveningMessage: "🎉 Thank you for attending ESSB & PATS Conference! Safe travels and stay connected!",
      breaks: [
        Break(time: TimeOfDay(hour: 12, minute: 00), message: "☕ Gomaa prayer & Last morning break! Make those final connections."),
        Break(time: TimeOfDay(hour: 19, minute: 00), message: "🍽️ Final lunch together! Cherish these moments."),
      ],
    ),
  ];

  // Initialize the notification service
  static Future<void> initialize() async {
    tz.initializeTimeZones();
    
    // Android initialization settings
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // iOS initialization settings
    const DarwinInitializationSettings iOSSettings =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const InitializationSettings initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iOSSettings,
    );

    await _notifications.initialize(initSettings);
    
    // Request permissions
    await requestPermissions();
  }

  // Request notification permissions
  static Future<void> requestPermissions() async {
    if (await Permission.notification.isDenied) {
      await Permission.notification.request();
    }
  }

  // Check if notifications are already scheduled
  static Future<bool> areNotificationsScheduled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('notifications_scheduled') ?? false;
  }

  // Mark notifications as scheduled
  static Future<void> markNotificationsScheduled() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notifications_scheduled', true);
  }

  // Schedule all conference notifications
  static Future<void> scheduleAllNotifications() async {
    // Check if already scheduled to avoid duplicates
    if (await areNotificationsScheduled()) {
      print('Notifications already scheduled');
      return;
    }

    await cancelAllNotifications(); // Clear any existing notifications
    
    int notificationId = 0;

    for (var day in conferenceDays) {
      // Morning notification (e.g., 8:00 AM)
      await _scheduleNotification(
        id: notificationId++,
        title: 'Good Morning! 🌅',
        body: day.morningMessage,
        scheduledDate: day.date,
        time: const TimeOfDay(hour: 8, minute: 0),
      );

      // Break notifications
      for (var breakTime in day.breaks) {
        await _scheduleNotification(
          id: notificationId++,
          title: 'Break Time',
          body: breakTime.message,
          scheduledDate: day.date,
          time: breakTime.time,
        );
      }

      // Evening notification (e.g., 6:00 PM)
      await _scheduleNotification(
        id: notificationId++,
        title: 'Day ${day.day} Complete! 🌙',
        body: day.eveningMessage,
        scheduledDate: day.date,
        time: const TimeOfDay(hour: 18, minute: 0),
      );
    }

    await markNotificationsScheduled();
    print('All notifications scheduled successfully');
  }

  // Schedule a single notification
  static Future<void> _scheduleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledDate,
    required TimeOfDay time,
  }) async {
    final DateTime scheduledDateTime = DateTime(
      scheduledDate.year,
      scheduledDate.month,
      scheduledDate.day,
      time.hour,
      time.minute,
    );

    // Only schedule if the time hasn't passed
    if (scheduledDateTime.isAfter(DateTime.now())) {
      await _notifications.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.from(scheduledDateTime, tz.local),
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'conference_channel',
            'Conference Notifications',
            channelDescription: 'Notifications for conference events',
            importance: Importance.high,
            priority: Priority.high,
            showWhen: true,
          ),
          iOS: DarwinNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
          ),
        ),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
      );
    }
  }

  // Cancel all notifications
  static Future<void> cancelAllNotifications() async {
    await _notifications.cancelAll();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notifications_scheduled', false);
  }

  // Get pending notifications (for debugging)
  static Future<List<PendingNotificationRequest>> getPendingNotifications() async {
    return await _notifications.pendingNotificationRequests();
  }
}

// Data models
class ConferenceDay {
  final int day;
  final DateTime date;
  final String morningMessage;
  final String eveningMessage;
  final List<Break> breaks;

  ConferenceDay({
    required this.day,
    required this.date,
    required this.morningMessage,
    required this.eveningMessage,
    required this.breaks,
  });
}

class Break {
  final TimeOfDay time;
  final String message;

  Break({required this.time, required this.message});
}

// Example usage in your app
class ConferenceApp extends StatefulWidget {
  const ConferenceApp({Key? key}) : super(key: key);

  @override
  State<ConferenceApp> createState() => _ConferenceAppState();
}

class _ConferenceAppState extends State<ConferenceApp> {
  @override
  void initState() {
    super.initState();
    _initializeNotifications();
  }

  Future<void> _initializeNotifications() async {
    await ConferenceNotificationService.initialize();
    await ConferenceNotificationService.scheduleAllNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        title: const Text('Conference App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Conference Notifications Active',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await ConferenceNotificationService.scheduleAllNotifications();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Notifications scheduled!')),
                );
              },
              child: const Text('Schedule Notifications'),
            ),
            
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                final pending = await ConferenceNotificationService.getPendingNotifications();
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Pending Notifications'),
                    content: Text('${pending.length} notifications scheduled'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Check Pending'),
            ),
          ],
        ),
      ),
    );
  }
}