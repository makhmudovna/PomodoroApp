import 'package:flutter/material.dart';
import 'package:pomodoro/app_theme.dart';
import 'package:pomodoro/splash_page/onboarding_page.dart';

class PomodoroApp extends StatelessWidget {
  const PomodoroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const OnboardingPage(),
      title: 'Focuso',
      // routes: {
      //   '/': (context) => const SplashScreen(),
      //   '/onboarding': (context) => const OnboardingPage(),
      //   '/home': (context) => const HomePage(),
      // },
      theme: AppTheme.light,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column());
  }
}
