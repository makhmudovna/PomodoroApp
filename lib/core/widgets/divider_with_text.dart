import 'package:flutter/material.dart';
import 'package:pomodoro/core/theme/text_styles.dart';
import 'package:pomodoro/core/constants/app_size.dart';

class DividerWithText extends StatelessWidget {
  const DividerWithText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: Colors.grey)),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.dividerHorizontalPadding,
          ),
          child: Text("or continue with", style: AppTextStyles.link),
        ),
        const Expanded(child: Divider(color: Colors.grey)),
      ],
    );
  }
}