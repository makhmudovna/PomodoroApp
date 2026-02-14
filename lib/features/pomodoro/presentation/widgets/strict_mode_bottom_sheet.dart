import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro/core/constants/app_color.dart';

class StrictModeBottomSheet extends StatefulWidget {
  const StrictModeBottomSheet({super.key});

  @override
  State<StrictModeBottomSheet> createState() => _StrictModeBottomSheetState();
}

class _StrictModeBottomSheetState extends State<StrictModeBottomSheet> {
  bool blockNotifications = true;
  bool blockPhoneCalls = true;
  bool blockOtherApps = false;
  bool lockPhone = false;
  bool prohibitExit = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
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
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          const SizedBox(height: 10),

          // Title
          Text(
            'Strict Mode',
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

          const SizedBox(height: 8),

          // Options
          _buildOption(
            'Block All Notifications',
            blockNotifications,
            (value) => setState(() => blockNotifications = value),
          ),

          Divider(
            color: Colors.grey.shade200,
            thickness: 1,
            height: 1,
          ),

          const SizedBox(height: 8),

          _buildOption(
            'Block Phone Calls',
            blockPhoneCalls,
            (value) => setState(() => blockPhoneCalls = value),
          ),

          Divider(
            color: Colors.grey.shade200,
            thickness: 1,
            height: 1,
          ),

          const SizedBox(height: 8),

          _buildOption(
            'Block Other Apps',
            blockOtherApps,
            (value) => setState(() => blockOtherApps = value),
          ),

          Divider(
            color: Colors.grey.shade200,
            thickness: 1,
            height: 1,
          ),

          const SizedBox(height: 8),

          _buildOption(
            'Lock Phone',
            lockPhone,
            (value) => setState(() => lockPhone = value),
          ),

          Divider(
            color: Colors.grey.shade200,
            thickness: 1,
            height: 1,
          ),

          const SizedBox(height: 8),

          _buildOption(
            'Prohibit to Exit',
            prohibitExit,
            (value) => setState(() => prohibitExit = value),
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
                    backgroundColor: AppColor.appColorPrimary.withOpacity(0.1),
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
                    // ✅ Return settings
                    Navigator.pop(context, {
                      'blockNotifications': blockNotifications,
                      'blockPhoneCalls': blockPhoneCalls,
                      'blockOtherApps': blockOtherApps,
                      'lockPhone': lockPhone,
                      'prohibitExit': prohibitExit,
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

  Widget _buildOption(String title, bool value, Function(bool) onChanged) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: 40, // kerakli kenglik
            height: 40, // kerakli balandlik
            child: Transform.scale(
              scale: 0.7,
              child: Switch(
                value: value,
                onChanged: onChanged,
                activeColor: Colors.white,
                activeTrackColor: AppColor.appColorPrimary,
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: Colors.grey.shade200,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<Map<String, dynamic>?> showStrictModeBottomSheet(BuildContext context) {
  return showModalBottomSheet<Map<String, dynamic>>(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (context) => const StrictModeBottomSheet(),
  );
}
