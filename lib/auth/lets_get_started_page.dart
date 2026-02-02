import 'package:flutter/material.dart';
import 'package:pomodoro/auth/sign_in_page.dart';
import 'package:pomodoro/features/app_color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro/auth/sign_up_page.dart';

class LetsGetStartedPage extends StatelessWidget {
  const LetsGetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 40),

                //Logo
                Image(
                  image: AssetImage('assets/clock.png'),
                  color: AppColor.appColorPrimary,
                  height: 80,
                ),

                const SizedBox(height: 24),

                Text(
                  "Let's Get Started!",
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  "Let's dive in into your account",
                  style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
                ),

                const SizedBox(height: 32),

                /// SOCIAL BUTTONS
                _socialButton('Continue with Google', 'assets/google.png'),
                _socialButton('Continue with Apple', 'assets/apple.png'),
                _socialButton('Continue with Facebook', 'assets/facebook.png'),
                _socialButton('Continue with X', 'assets/x.png'),

                const Spacer(),

                /// SIGN UP
                _authButton(
                  text: 'Sign up',
                  backgroundColor: AppColor.appColorPrimary,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SignUpPage()),
                    );
                  },
                ),

                const SizedBox(height: 12),

                _authButton(
                  text: 'Sign in',
                  backgroundColor: AppColor.skipButton,
                  textColor: AppColor.appColorPrimary,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SignInPage()),
                    );
                  },
                ),

                const SizedBox(height: 16),

                /// PRIVACY
                Text(
                  "Privacy Policy  ·  Terms of Service",
                  style: GoogleFonts.poppins(fontSize: 8, color: Colors.grey),
                ),

                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _socialButton(String text, String image) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 50),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          side: BorderSide(color: Colors.grey.shade300, width: 1),
          elevation: 1,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 10.5,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(image, height: 24, width: 24),
            ),
          ],
        ),
      ),
    );
  }

  Widget _authButton({
    required String text,
    required Color backgroundColor,
    required Color textColor,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        minimumSize: const Size(double.infinity, 52),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 1,
      ),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
    );
  }
}
