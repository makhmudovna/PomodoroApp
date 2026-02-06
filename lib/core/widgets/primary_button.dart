import 'package:flutter/material.dart';
import 'package:pomodoro/core/constants/app_color.dart';
import 'package:pomodoro/core/constants/app_size.dart';
import 'package:pomodoro/core/theme/text_styles.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const PrimaryButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: AppSizes.buttonHeight,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.appColorPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
              ),
              elevation: 1,
            ),
            child: Text(text, style: AppTextStyles.button),
          ),
        ),
        const SizedBox(height: AppSizes.spacingMedium),
      ],
    );
  }
}
