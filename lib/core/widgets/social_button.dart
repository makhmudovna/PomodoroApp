import 'package:flutter/material.dart';
import 'package:pomodoro/core/constants/app_size.dart';

class SocialButton extends StatelessWidget {
  final String imagePath;

  const SocialButton({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSizes.socialButtonWidth,
      height: AppSizes.socialButtonHeight,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.white,
          shape: StadiumBorder(side: BorderSide(color: Colors.grey.shade200)),
          padding: EdgeInsets.zero,
          minimumSize: Size(
            AppSizes.socialButtonWidth,
            AppSizes.socialButtonHeight,
          ),
        ),
        child: Image.asset(
          imagePath,
          width: AppSizes.socialIconSize,
          height: AppSizes.socialIconSize,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
