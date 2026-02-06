import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro/core/constants/app_color.dart';

class AppTextStyles {
  static final title = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static final subtitle = GoogleFonts.poppins(fontSize: 10, color: Colors.grey);

  static final label = GoogleFonts.poppins(
    fontSize: 10,
    fontWeight: FontWeight.bold,
  );

  static final link = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: Colors.grey,
  );

  static final button = const TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static const bodyMedium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static const linkText = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColor.appColorPrimary,
  );
}
