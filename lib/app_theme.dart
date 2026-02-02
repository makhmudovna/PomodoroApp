import 'package:flutter/material.dart';
import 'package:pomodoro/features/app_color.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColor.appColorPrimary,
    colorScheme: const ColorScheme.light(
      primary: AppColor.appColorPrimary,
      background: Colors.white,
      onBackground: Colors.black,
    ),
    useMaterial3: true,
  );
}
