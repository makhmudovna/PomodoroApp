import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro/core/constants/app_color.dart';
import 'package:pomodoro/core/widgets/app_base.dart';
import 'package:pomodoro/features/pomodoro/presentation/widgets/bottom_nav_bar.dart';
import 'package:pomodoro/features/pomodoro/presentation/widgets/current_task_card.dart';
import 'package:pomodoro/features/pomodoro/presentation/widgets/stric_mode.dart';
import 'package:pomodoro/features/pomodoro/presentation/widgets/timer_widget.dart';
import 'package:pomodoro/features/pomodoro/presentation/widgets/user_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isTaskExpanded = false;

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
              taskTitle: 'Creat a Design Wireframe',
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

            //Timer yozilishi kerak
            TimerWidget(),

            const SizedBox(height: 16),

            StricMode(),

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
              taskTitle: 'Creat a Design Wireframe',
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
              taskTitle: 'Creat a Design Wireframe',
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
