import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro/core/widgets/app_text_field.dart';
import 'package:pomodoro/core/widgets/divider_with_text.dart';
import 'package:pomodoro/core/widgets/primary_button.dart';
import 'package:pomodoro/core/widgets/social_button.dart';
import 'package:pomodoro/features/auth/presentation/pages/create_password.dart';
import 'package:pomodoro/core/constants/app_color.dart';
import 'package:pomodoro/core/constants/auth_text.dart';
import 'package:pomodoro/core/constants/app_size.dart';
import 'package:pomodoro/core/theme/text_styles.dart';
import 'package:pomodoro/features/auth/presentation/pages/sign_in_page.dart';
import 'package:pomodoro/features/pomodoro/presentation/pages/home_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late TapGestureRecognizer _signInTap;
  bool _isPasswordHidden = true;
  bool _agreeTerms = false;

  @override
  void initState() {
    super.initState();
    _signInTap = TapGestureRecognizer()
      ..onTap = () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const SignInPage()),
        );
      };
  }

  @override
  void dispose() {
    _signInTap.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.paddingHorizontal,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppSizes.spacingMedium),

                Text(AuthText.joinTitle, style: AppTextStyles.title),
                const SizedBox(height: AppSizes.spacingSmall),

                Text(AuthText.joinSubtitle, style: AppTextStyles.subtitle),
                const SizedBox(height: AppSizes.spacingLarge),

                Text("Email", style: AppTextStyles.label),
                const SizedBox(height: AppSizes.spacingSmall),
                AppTextField(hint: 'Email', icon: Icons.email_outlined),

                const SizedBox(height: AppSizes.spacingMedium),

                Text("Password", style: AppTextStyles.label),
                const SizedBox(height: AppSizes.spacingSmall),
                AppTextField(
                  hint: 'Password',
                  icon: Icons.lock_outline,
                  isPassword: true,
                ),

                const SizedBox(height: AppSizes.spacingMedium),

                Row(
                  children: [
                    Checkbox(
                      value: _agreeTerms,
                      onChanged: (value) {
                        setState(() => _agreeTerms = value!);
                      },
                      checkColor: Colors.white,
                      side: BorderSide(
                        color: AppColor.appColorPrimary,
                        width: 2,
                      ),
                      activeColor: AppColor.appColorPrimary,
                    ),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          text: "I agree to Focuso ",
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                          children: [
                            TextSpan(
                              text: "Terms & Conditions",
                              style: TextStyle(
                                color: AppColor.appColorPrimary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: AppSizes.spacingMedium),

                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Already have an account? ",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        TextSpan(
                          text: "Sign in",
                          style: TextStyle(
                            color: AppColor.appColorPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: _signInTap,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: AppSizes.spacingLarge),

                const DividerWithText(),

                const SizedBox(height: AppSizes.spacingMedium),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SocialButton(imagePath: 'assets/google.png'),
                    SocialButton(imagePath: 'assets/apple.png'),
                    SocialButton(imagePath: 'assets/facebook.png'),
                    SocialButton(imagePath: 'assets/x.png'),
                  ],
                ),

                const SizedBox(height: 60),

                PrimaryButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const HomePage()),
                    );
                  },
                  text: "Sign up",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
