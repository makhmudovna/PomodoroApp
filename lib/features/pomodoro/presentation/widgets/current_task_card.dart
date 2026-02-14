import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CurrentTaskCard extends StatelessWidget {
  final String taskTitle;
  final int completedPomodoros;
  final int totalPomodoros;
  final int completedMinutes;
  final int totalMinutes;
  final Color iconColor;
  final String image;
  final VoidCallback? onTap;
  final bool isExpanded;

  const CurrentTaskCard({
    super.key,
    required this.taskTitle,
    required this.completedPomodoros,
    required this.totalPomodoros,
    required this.completedMinutes,
    required this.totalMinutes,
    this.iconColor = const Color(0xFFFF4749),
    required this.image,
    this.onTap,
    this.isExpanded = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6), // ✅ To'g'rilandi: 6 dan 16 ga
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Task Icon
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: iconColor,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Image.asset(
                'assets/home_page_assets/photo-capture.png',
                width: 35,
                height: 35,
                fit: BoxFit.contain,
                color: Colors.white,
              ),
            ),
          ),

          const SizedBox(width: 14),

          // Task Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Task Title
                Text(
                  taskTitle,
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    height: 1.2,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 6),

                // Progress Info
                Row(
                  children: [
                    // Pomodoro icon
                    Icon(
                      Icons.play_circle_outline,
                      size: 16,
                      color: Colors.grey.shade600,
                    ),

                    const SizedBox(width: 4),

                    // Pomodoros count
                    Text(
                      '$completedPomodoros/$totalPomodoros',
                      style: GoogleFonts.poppins(
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade600,
                      ),
                    ),

                    const SizedBox(width: 8),

                    // Dot separator
                    Container(
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        shape: BoxShape.circle,
                      ),
                    ),

                    const SizedBox(width: 8),

                    // Minutes
                    Text(
                      '$completedMinutes/$totalMinutes mins',
                      style: GoogleFonts.poppins(
                        fontSize: 8,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          // Dropdown Icon
          InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Icon(
                isExpanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                color: Colors.grey.shade700,
                size: 26,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
