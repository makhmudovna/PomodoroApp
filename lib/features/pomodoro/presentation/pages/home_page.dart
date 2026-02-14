import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro/core/constants/app_color.dart';
import 'package:pomodoro/core/widgets/app_base.dart';
import 'package:pomodoro/features/pomodoro/data/model/white_noise_player.dart';
import 'package:pomodoro/features/pomodoro/presentation/widgets/bottom_nav_bar.dart';
import 'package:pomodoro/features/pomodoro/presentation/widgets/current_task_card.dart';
import 'package:pomodoro/features/pomodoro/presentation/widgets/stric_mode.dart';
import 'package:pomodoro/features/pomodoro/presentation/widgets/timer_card.dart';
import 'package:pomodoro/features/pomodoro/presentation/widgets/user_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isTaskExpanded = false;

  // ✅ White Noise o'zgaruvchilari (elon qilindi)
  final WhiteNoisePlayer _whiteNoisePlayer = WhiteNoisePlayer();
  String? _selectedSound;
  double? _volume;

  @override
  void dispose() {
    // Stop sound when leaving page
    _whiteNoisePlayer.stop();
    super.dispose();
  }

  // ✅ White Noise settings handler
  void _handleWhiteNoiseSettings(Map<String, dynamic>? result) {
    if (result != null) {
      setState(() {
        _selectedSound = result['sound']; // ✅ Saqlandi
        _volume = result['volume']; // ✅ Saqlandi
      });

      print('✅ Sound: $_selectedSound');
      print('✅ Volume: $_volume');

      // Ovozni ijro qilish
      if (_selectedSound != null &&
          _selectedSound != 'None' &&
          _volume != null) {
        _whiteNoisePlayer.play(_selectedSound!, _volume!);
      } else {
        _whiteNoisePlayer.stop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBaseNoAppBar(
      backgroundColor: AppColor.surfaceTintColor,
      bottomNavigationBar: BottomNavBar(),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            UserHeader(
              userName: 'Sipsagul Sarafboyeva',
              userImage: 'assets/avatar.jpg',
              welcomeMassage: 'Welcome back!',
              hasNotification: true,
              onNotificationTap: () {
                print('Notification tapped');
              },
            ),
            const SizedBox(height: 16),

            CurrentTaskCard(
              taskTitle: 'Create a Design Wireframe',
              completedPomodoros: 4,
              totalPomodoros: 6,
              completedMinutes: 100,
              totalMinutes: 150,
              image: 'assets/home_page_assets/photo-capture.png',
              isExpanded: _isTaskExpanded,
              onTap: () {
                setState(() {
                  _isTaskExpanded = !_isTaskExpanded;
                });
              },
            ),

            const SizedBox(height: 16),

            // Timer
            TimerCard(),

            const SizedBox(height: 16),

            // ✅ StricMode with callback
            StricMode(
              onWhiteNoiseChanged: _handleWhiteNoiseSettings,
            ),

            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recent Tasks",
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                InkWell(
                  onTap: () {
                    print("View All bosildi");
                  },
                  child: Row(
                    children: const [
                      Text(
                        "View All",
                        style: TextStyle(
                          color: AppColor.appColorPrimary,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: AppColor.appColorPrimary,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            CurrentTaskCard(
              taskTitle: 'Designing Brand Logos',
              completedPomodoros: 4,
              totalPomodoros: 6,
              completedMinutes: 100,
              totalMinutes: 150,
              image: 'assets/home_page_assets/photo-capture.png',
              isExpanded: _isTaskExpanded,
              onTap: () {
                setState(() {
                  _isTaskExpanded = !_isTaskExpanded;
                });
              },
            ),

            const SizedBox(height: 16),

            CurrentTaskCard(
              taskTitle: 'Write a Report & Proposal',
              completedPomodoros: 4,
              totalPomodoros: 6,
              completedMinutes: 100,
              totalMinutes: 150,
              image: 'assets/home_page_assets/photo-capture.png',
              isExpanded: _isTaskExpanded,
              onTap: () {
                setState(() {
                  _isTaskExpanded = !_isTaskExpanded;
                });
              },
            ),

            const SizedBox(height: 16),

            CurrentTaskCard(
              taskTitle: 'Create a Design Wireframe',
              completedPomodoros: 4,
              totalPomodoros: 6,
              completedMinutes: 100,
              totalMinutes: 150,
              image: 'assets/home_page_assets/photo-capture.png',
              isExpanded: _isTaskExpanded,
              onTap: () {
                setState(() {
                  _isTaskExpanded = !_isTaskExpanded;
                });
              },
            ),

            const SizedBox(height: 16),

            CurrentTaskCard(
              taskTitle: 'Create a Design Wireframe',
              completedPomodoros: 4,
              totalPomodoros: 6,
              completedMinutes: 100,
              totalMinutes: 150,
              image: 'assets/home_page_assets/photo-capture.png',
              isExpanded: _isTaskExpanded,
              onTap: () {
                setState(() {
                  _isTaskExpanded = !_isTaskExpanded;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
