import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pomodoro/auth/app_widgets.dart';
import 'package:pomodoro/auth/auth_text.dart';
import 'package:pomodoro/auth/text_styles.dart';
import 'package:pomodoro/features/app_size.dart';

class OtpCode extends StatefulWidget {
  const OtpCode({super.key});

  @override
  State<OtpCode> createState() => _OtpCodeState();
}

class _OtpCodeState extends State<OtpCode> {
  // Controllers va focusNodes
  final List<TextEditingController> _controllers = List.generate(
    4,
    (index) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());

  int _focusedIndex = 0;

  int _secondsRemaining = 59;
  bool _canResend = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _startTimer();

    for (int i = 0; i < 4; i++) {
      _focusNodes[i].addListener(() {
        if (_focusNodes[i].hasFocus) {
          setState(() {
            _focusedIndex = i;
          });
        }
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();

    for (var node in _focusNodes) {
      node.dispose();
    }
    for (var controller in _controllers) {
      controller.dispose();
    }

    super.dispose();
  }

  void _startTimer() {
    setState(() {
      _canResend = false;
      _secondsRemaining = 59;
    });

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        setState(() {
          _canResend = true;
        });
        _timer?.cancel();
      }
    });
  }

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSizes.spacingMedium),

              Text(AuthText.otpTitle, style: AppTextStyles.title),
              const SizedBox(height: AppSizes.spacingSmall),
              Text(AuthText.otpSubtitle, style: AppTextStyles.subtitle),
              const SizedBox(height: AppSizes.spacingLarge),

              // OTP boxes
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  return Padding(
                    padding: EdgeInsets.only(right: index < 3 ? 8 : 0),
                    child: PasswordBox(
                      controller: _controllers[index],
                      focusNode: _focusNodes[index],
                      index: index,
                      focusNodes: _focusNodes,
                      onChangedCallback: () {
                        setState(() {});
                      },
                    ),
                  );
                }),
              ),

              const SizedBox(height: 20),

              // Timer text
              Center(
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                    children: [
                      const TextSpan(text: "You can resend the code in "),
                      TextSpan(
                        text: "$_secondsRemaining",
                        style: const TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const TextSpan(text: " seconds"),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Resend code button
              TextButton(
                onPressed: _canResend ? _startTimer : null,
                child: Center(
                  child: Text(
                    "Resend code",
                    style: TextStyle(
                      color: _canResend ? Colors.black : Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
