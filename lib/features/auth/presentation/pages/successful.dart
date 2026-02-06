import 'package:flutter/material.dart';
import 'package:pomodoro/core/constants/auth_text.dart';
import 'package:pomodoro/core/theme/text_styles.dart';
import 'package:pomodoro/core/constants/app_size.dart';
import 'package:pomodoro/core/widgets/primary_button.dart';
import 'package:pomodoro/features/auth/presentation/pages/sign_in_page.dart';

class Successful extends StatelessWidget {
  const Successful({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.paddingHorizontal,
          ),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/password_new.png',
                      height: AppSizes.successImageSize,
                      width: AppSizes.successImageSize,
                    ),

                    Text(
                      AuthText.successfulTitle,
                      style: AppTextStyles.title,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppSizes.spacingSmall),
                    Text(
                      AuthText.successfulSubtitle,
                      style: AppTextStyles.subtitle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              PrimaryButton(onPressed: (){
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const SignInPage()),
                  );
                }, text: 'Sign in',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
