import 'package:flutter/material.dart';
import 'package:pomodoro/core/widgets/app_base.dart';
import 'package:pomodoro/features/pomodoro/presentation/widgets/user_header.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBaseNoAppBar(
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

          
        ],
      ),
    );
  }
}