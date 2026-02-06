import 'package:flutter/material.dart';
import 'package:pomodoro/core/constants/app_size.dart';
import 'package:pomodoro/core/theme/text_styles.dart';

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
