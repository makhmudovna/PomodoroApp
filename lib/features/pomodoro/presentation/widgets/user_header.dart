import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro/core/constants/app_color.dart';

class UserHeader extends StatelessWidget {
  final String userName;
  final String userImage;
  final String welcomeMassage;
  final bool hasNotification; // Qizil nuqta ko'rsatish uchun
  final VoidCallback? onNotificationTap;

  const UserHeader(
      {super.key,
      required this.userName,
      required this.userImage,
      this.welcomeMassage = 'Welcome back!',
      this.hasNotification = false,
      this.onNotificationTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 22,
          backgroundImage: AssetImage(userImage),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userName,
                  style: GoogleFonts.poppins(
                      fontSize: 12, fontWeight: FontWeight.bold)),
              const SizedBox(height: 2),
              Row(
                children: [
                  Text(
                    welcomeMassage,
                    style: GoogleFonts.poppins(
                        fontSize: 10, color: Colors.grey.shade600),
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    '👋',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
    
        // Notification button
         Stack(
          children: [
            Container(
              height: 44,
              width: 44,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey.shade300,
                  width: 1.5,
                ),
              ),
              child: IconButton(
                onPressed: onNotificationTap ?? () {},
                icon:  const Icon(
                  CupertinoIcons.bell,
                  size: 30,
                ),
              ),
            ),
    
            // Red notification dot
            if (hasNotification)
              Positioned(
                right: 12,
                top: 12,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: AppColor.appColorPrimary,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
          ],
        )
      ],
    );
  }
}
