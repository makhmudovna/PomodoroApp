import 'package:flutter/material.dart';
import 'package:pomodoro/core/widgets/app_text_field.dart';
import 'package:pomodoro/core/widgets/divider_with_text.dart';
import 'package:pomodoro/core/widgets/primary_button.dart';
import 'package:pomodoro/core/widgets/social_button.dart';
import 'package:pomodoro/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:pomodoro/features/auth/presentation/pages/successful.dart';
import 'package:pomodoro/core/constants/app_color.dart';
import 'package:pomodoro/core/constants/auth_text.dart';
import 'package:pomodoro/core/constants/app_size.dart';
import 'package:pomodoro/core/theme/text_styles.dart';
import 'package:pomodoro/features/auth/presentation/pages/sign_up_page.dart';
import 'package:flutter/gestures.dart';
import 'package:pomodoro/features/pomodoro/presentation/pages/home_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _rememberMe = false;
  late TapGestureRecognizer _signUpTap;

  @override
  void initState() {
    super.initState();
    _signUpTap = TapGestureRecognizer()
      ..onTap = () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const SignUpPage()),
        );
      };
  }

  @override
  void dispose() {
    _signUpTap.dispose();
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

                Text(AuthText.welcomeTitle, style: AppTextStyles.title),
                const SizedBox(height: AppSizes.spacingSmall),

                Text(AuthText.welcomeSubtitle, style: AppTextStyles.subtitle),
                const SizedBox(height: AppSizes.spacingLarge),

                Text("Email", style: AppTextStyles.label),
                const SizedBox(height: AppSizes.spacingSmall),
                AppTextField(hint: 'Email', icon: Icons.email_outlined),

                const SizedBox(height: AppSizes.spacingMedium),

                Text("Password", style: AppTextStyles.label),
                const SizedBox(height: AppSizes.spacingSmall),
                AppTextField(hint: 'Password', icon: Icons.lock_outline,isPassword: true,),

                const SizedBox(height: AppSizes.spacingMedium),

                //shu yerdan joylashim kerak
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// Remember me
                    Row(
                      children: [
                        Checkbox(
                          value: _rememberMe,
                          onChanged: (value) {
                            setState(() => _rememberMe = value!);
                          },
                          checkColor: Colors.white,
                          side: BorderSide(
                            color: AppColor.appColorPrimary,
                            width: AppSizes.checkboxBorderWidth,
                          ),
                          activeColor: AppColor.appColorPrimary,
                        ),
                        SizedBox(width: AppSizes.spacingXS),
                        Text(
                          AuthText.rememberMe,
                          style: AppTextStyles.bodyMedium,
                        ),
                      ],
                    ),

                    /// Forgot password
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ForgotPasswordPage(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: AppSizes.tapPadding,
                        ),
                        child: Text(
                          AuthText.forgotPassword,
                          style: AppTextStyles.linkText,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: AppSizes.spacingMedium),

                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Don't have an account? ",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        TextSpan(
                          text: "Sign up",
                          style: TextStyle(
                            color: AppColor.appColorPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: _signUpTap,
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
                  text: 'Sign in',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
