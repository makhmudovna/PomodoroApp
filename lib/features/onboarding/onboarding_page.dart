import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro/core/constants/app_color.dart';
import 'package:pomodoro/core/widgets/app_base.dart';
import 'package:pomodoro/features/onboarding_model.dart';
import 'package:pomodoro/core/constants/onboarding_text.dart';
import 'package:pomodoro/features/auth/presentation/pages/lets_get_started_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingModel> _page = [
    OnboardingModel(
      lightImage: 'assets/light_time.png',
      darkImage: 'assets/dark_time.png',
      title: AppTexts.onboardingTitle1,
      description: AppTexts.onboardingDesc1,
    ),
    OnboardingModel(
      lightImage: 'assets/light_task.png',
      darkImage: 'assets/dark_task.png',
      title: AppTexts.onboardingTitle2,
      description: AppTexts.onboardingDesc2,
    ),
    OnboardingModel(
      lightImage: 'assets/light_calendar.png',
      darkImage: 'assets/dark_calendar.png',
      title: AppTexts.onboardingTitle3,
      description: AppTexts.onboardingDesc3,
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _page.length - 1) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 450),
        curve: Curves.easeInOutCubic,
      );
    } else {
      _finishedOnboarding();
    }
  }


  void _finishedOnboarding() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LetsGetStartedPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    print("PAGES: ${_page}");
    return AppBaseNoAppBar(
      backgroundColor: AppColor.appColorPrimary,
      child: Column(
       children: [
         Expanded(
           child: PageView.builder(
             itemBuilder: (context, index) {
               return _buildPage(_page[index]);
             },
             physics: const NeverScrollableScrollPhysics(),
             controller: _pageController,
             onPageChanged: (index) {
               setState(() {
                 _currentPage = index;
               });
             },
             itemCount: _page.length,
           ),
         ),
       ],
              ),
    );
  }

  Widget _buildPage(OnboardingModel page) {
    return Stack(
      children: [
        Center(
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Align(
                alignment: const Alignment(0, -0.6),
                child: Image.asset(
                  page.lightImage,
                  width: MediaQuery.of(context).size.width * 0.85,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: ClipPath(
            clipper: ConcaveTopClipper(),
            child: Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.45,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  Text(
                    page.title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    page.description,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 9,
                      color: Colors.grey,
                      height: 1.5,
                    ),
                  ),
                  _buildBottomSection(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomSection() {
    return Container(
      padding: EdgeInsets.only(top: 30, bottom: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _page.length,
              (index) => AnimatedContainer(
                duration: Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 4),
                height: 8,
                width: _currentPage == index ? 30 : 8,
                decoration: BoxDecoration(
                  color: _currentPage == index
                      ? AppColor.appColorPrimary
                      : Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),

          // Buttons
          Row(
            children: [
              if (_currentPage < _page.length - 1)
                Expanded(
                  child: TextButton(
                    onPressed: _finishedOnboarding,
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: AppColor.skipButton,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Skip',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColor.appColorPrimary,
                      ),
                    ),
                  ),
                ),
              if (_currentPage < _page.length - 1) SizedBox(width: 12),
              // Continue/Get Started button
              Expanded(
                child: ElevatedButton(
                  onPressed: _nextPage,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: AppColor.appColorPrimary,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    _currentPage == _page.length - 1
                        ? "Let's Get Started"
                        : 'Continue',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ConcaveTopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double curveDepth = 50.0; // Egilish chuqurligi

    // Chapdan boshlaymiz
    path.lineTo(0, 0);

    // Yuqori qismda konkav (ichkariga egilgan) shakl
    path.quadraticBezierTo(
      size.width / 2, // O'rtadagi nazorat nuqtasi (X)
      curveDepth, // Pastga egilish (Y)
      size.width, // O'ng tomonga yetadi
      0, // Yuqoridan boshlaydi
    );

    // O'ng tomonga
    path.lineTo(size.width, size.height);
    // Pastga
    path.lineTo(0, size.height);
    // Yopamiz
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
