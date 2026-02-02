import 'package:flutter/material.dart';
import 'package:pomodoro/auth/text_styles.dart';
import 'package:pomodoro/features/app_size.dart';
import '../features/app_color.dart';
import 'package:flutter/services.dart';

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

class AppTextField extends StatefulWidget {
  final String hint;
  final IconData icon;
  final bool isPassword;

  const AppTextField({
    super.key,
    required this.hint,
    required this.icon,
    this.isPassword = false,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.isPassword ? _isPasswordHidden : false,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: AppTextStyles.subtitle.copyWith(fontSize: 12),
        prefixIcon: Icon(widget.icon),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _isPasswordHidden
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordHidden = !_isPasswordHidden;
                  });
                },
              )
            : null,
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

class PasswordBox extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final int index;
  final List<FocusNode> focusNodes;
  final VoidCallback onChangedCallback;

  const PasswordBox({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.index,
    required this.focusNodes,
    required this.onChangedCallback,
  });

  @override
  Widget build(BuildContext context) {
    bool hasValue = controller.text.isNotEmpty;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      height: 65,
      width: hasValue ? 70 : 65,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: hasValue ? AppColor.appColorPrimary : Colors.transparent,
          width: 2,
        ),
        boxShadow: hasValue
            ? [
                BoxShadow(
                  color: AppColor.appColorPrimary.withOpacity(0.2),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ]
            : [],
      ),
      child: Center(
        child: TextField(
          controller: controller,
          focusNode: focusNode,
          onChanged: (value) {
            onChangedCallback();
            if (value.length == 1 && index < focusNodes.length - 1) {
              focusNodes[index + 1].requestFocus();
            } else if (value.isEmpty && index > 0) {
              focusNodes[index - 1].requestFocus();
            }
          },
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly,
          ],
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.zero,
          ),
        ),
      ),
    );
  }
}
