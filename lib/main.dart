import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'config/theme/app_theme.dart';
import 'features/onboarding/screens/onboarding_screen.dart';
import 'features/bookmarks/screens/bookmarks_screen.dart';
import 'providers/bookmark_provider.dart';

void main() {
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