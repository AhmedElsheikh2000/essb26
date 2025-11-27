import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'config/theme/app_theme.dart';
import 'features/onboarding/screens/onboarding_screen.dart';
import 'features/bookmarks/screens/bookmarks_screen.dart';
import 'providers/bookmark_provider.dart';
import 'services/conference_notification_service.dart';

void main() async{
  // REQUIRED: Must call this before any async operations in main()
  // This ensures Flutter is properly initialized before we use plugins
  WidgetsFlutterBinding.ensureInitialized();
    // Initialize the notification system
   // This sets up the notification channels and requests permissions
  await ConferenceNotificationService.initialize();
  // await ConferenceNotificationService.scheduleImmediateTestNotification(); //TESTING 
    // Schedule all conference notifications
  // This will schedule morning, break, and evening notifications for all 3 days
  // It won't duplicate if already scheduled (uses SharedPreferences to check)
  await ConferenceNotificationService.scheduleAllNotifications();


  runApp(
    ChangeNotifierProvider(
      create: (context) => BookmarkProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ESSB & PATS Conference',
      theme: AppTheme.lightTheme,
      home: const OnboardingScreen(),
      routes: {
        '/bookmarks': (context) => const BookmarksScreen(),
      },
    );
  }
}
