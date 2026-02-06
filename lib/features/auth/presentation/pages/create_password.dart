import 'package:flutter/material.dart';
import 'package:pomodoro/core/widgets/app_text_field.dart';
import 'package:pomodoro/core/constants/auth_text.dart';
import 'package:pomodoro/core/theme/text_styles.dart';
import 'package:pomodoro/core/constants/app_size.dart';
import 'package:pomodoro/core/widgets/primary_button.dart';

class CreatePassword extends StatefulWidget {
  const CreatePassword({super.key});

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios,color: Colors.black,),
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.paddingHorizontal,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSizes.spacingMedium),
              Text(AuthText.createPasswordTitle, style: AppTextStyles.title),
              const SizedBox(height: AppSizes.spacingSmall),

              Text(
                AuthText.createPasswordSubtitle,
                style: AppTextStyles.subtitle,
              ),
              const SizedBox(height: AppSizes.spacingLarge),

              Text("Create new password", style: AppTextStyles.label),

              const SizedBox(height: AppSizes.spacingSmall),
              AppTextField(
                hint: 'Password',
                icon: Icons.lock_outline,
                isPassword: true,
              ),

              const SizedBox(height: AppSizes.spacingMedium),

              Text("Coniform new password", style: AppTextStyles.label),

              const SizedBox(height: AppSizes.spacingSmall),
              AppTextField(
                hint: 'Password',
                icon: Icons.lock_outline,
                isPassword: true,
              ),

              Spacer(),

              PrimaryButton(onPressed: () {}, text: 'Save New Password'),
            ],
          ),
        ),
      ),
    );
  }
}
