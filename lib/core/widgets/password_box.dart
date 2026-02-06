import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pomodoro/core/constants/app_color.dart';

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
