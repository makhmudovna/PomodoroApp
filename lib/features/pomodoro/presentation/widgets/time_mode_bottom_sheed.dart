import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro/core/constants/app_color.dart';

class TimeModeBottomSheed extends StatefulWidget {
  const TimeModeBottomSheed({super.key});

  @override
  State<TimeModeBottomSheed> createState() => _TimeModeBottomSheedState();
}

class _TimeModeBottomSheedState extends State<TimeModeBottomSheed> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 50,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          const SizedBox(height: 10),

          // Title
          Text(
            'Timer Mode',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 8),

          Divider(
            color: Colors.grey.shade200,
            thickness: 1,
            height: 1,
          ),

          _buildOption(
            0,
            '25:00 → 00:00',
            'Countdown from 25 minutes until time runs out.',
          ),

          Divider(
            color: Colors.grey.shade200,
            thickness: 1,
            height: 1,
          ),

          _buildOption(
            1,
            '00:00 → ∞',
            'Start counting from 0 until stopped manually.',
          ),

          Divider(
            color: Colors.grey.shade200,
            thickness: 1,
            height: 1,
          ),

          const SizedBox(height: 24),

          // Buttons
          Row(
            children: [
              // Cancel button
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        AppColor.appColorPrimary.withOpacity(0.1),
                    foregroundColor: AppColor.appColorPrimary,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Cancel',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
          
              const SizedBox(width: 12),
          
              // Save button
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // ✅ Return selected mode
                    Navigator.pop(context, {
                      'mode': selectedIndex == 0 ? 'countdown' : 'countup',
                      'selectedIndex': selectedIndex,
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.appColorPrimary,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Save',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildOption(int index, String title, String subtitle) {
    final bool isSelected = selectedIndex == index;

    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color:
                          isSelected ? AppColor.appColorPrimary : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              const Icon(
                Icons.check,
                color: AppColor.appColorPrimary,
                size: 24,
              ),
          ],
        ),
      ),
    );
  }
}

// ✅ TO'G'RILANGAN - Future qaytaradi
Future<Map<String, dynamic>?> showTimeModeBottomSheet(BuildContext context) {
  return showModalBottomSheet<Map<String, dynamic>>(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (context) => const TimeModeBottomSheed(),
  );
}
