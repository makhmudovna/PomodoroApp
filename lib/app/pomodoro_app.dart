import 'package:flutter/material.dart';
import 'package:pomodoro/features/onboarding/onboarding_page.dart';

class PomodoroApp extends StatelessWidget {
  const PomodoroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const OnboardingPage(),
      title: 'Pomodoro',
    );
  }
}
