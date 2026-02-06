import 'package:flutter/material.dart';
import 'package:pomodoro/core/widgets/primary_button.dart';
import 'package:pomodoro/features/auth/presentation/pages/otp_code.dart';
import 'package:pomodoro/core/constants/app_size.dart';
import 'package:pomodoro/core/constants/auth_text.dart';
import 'package:pomodoro/core/theme/text_styles.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingHorizontal),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: AppSizes.spacingMedium),

                      Text(
                        AuthText.forgotPasswordTitle,
                        style: AppTextStyles.title,
                      ),
                      const SizedBox(height: AppSizes.spacingSmall),
                      Text(
                        AuthText.forgotPasswordSubtitle,
                        style: AppTextStyles.subtitle,
                      ),
                      const SizedBox(height: AppSizes.spacingLarge),

                      Text(
                        "Registered Email address",
                        style: AppTextStyles.label,
                      ),
                      const SizedBox(height: AppSizes.spacingSmall),
                      _emailTextField(),
                    ],
                  ),
                ),
              ),

              /// Send OTP Code button
              PrimaryButton(onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const OtpCode()),
                  );
              }, text: 'Send OTP Code'),
            ],
          ),
        ),
      ),
    );
  }

Widget _emailTextField() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: "Email",
        hintStyle: AppTextStyles.subtitle.copyWith(fontSize: 12),
        prefixIcon: const Icon(Icons.email_outlined),
        filled: true,
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.textFieldRadius),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

}
