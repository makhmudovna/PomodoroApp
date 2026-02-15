import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro/core/constants/app_color.dart';

class WhiteNoiseBottomSheet extends StatefulWidget {
  const WhiteNoiseBottomSheet({super.key});

  @override
  State<WhiteNoiseBottomSheet> createState() => _WhiteNoiseBottomSheetState();
}

class _WhiteNoiseBottomSheetState extends State<WhiteNoiseBottomSheet> {
  double _volume = 70.0;
  String _selectedSound = 'Rainfall';

  final List<Map<String, dynamic>> _sounds = [
    {'name': 'None', 'isPremium': false},
    {'name': 'Rainfall', 'isPremium': false},
    {'name': 'Ocean Waves', 'isPremium': false},
    {'name': 'Forest Wind', 'isPremium': false},
    {'name': 'Crackling Fire', 'isPremium': true},
    {'name': 'Mountain Stream', 'isPremium': true},
    {'name': 'Night Crickets', 'isPremium': true},
    {'name': 'Thunderstorm', 'isPremium': true},
  ];

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
            'White Noise',
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

          const SizedBox(height: 10),

          // Volume Slider
          Row(
            children: [
              Text(
                'Volume',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: SliderTheme(
                  data: SliderThemeData(
                    activeTrackColor: AppColor.appColorPrimary,
                    inactiveTrackColor: Colors.grey.shade300,
                    thumbColor: Colors.white,
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 12,
                      elevation: 6,
                    ),
                    overlayColor: AppColor.appColorPrimary.withOpacity(0.3),
                    trackHeight: 4,
                  ),
                  child: Slider(
                    value: _volume,
                    min: 0,
                    max: 100,
                    onChanged: (value) {
                      setState(() => _volume = value);
                    },
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          Divider(
            color: Colors.grey.shade200,
            thickness: 1,
            height: 1,
          ),

          const SizedBox(height: 8),

          // Sound options list
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _sounds.length,
              itemBuilder: (context, index) {
                final sound = _sounds[index];
                final isSelected = _selectedSound == sound['name'];
                final isPremium = sound['isPremium'] as bool;

                return _buildSoundOption(
                  sound['name'],
                  isSelected,
                  isPremium,
                );
              },
            ),
          ),

          const SizedBox(height: 16),

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
                    // ✅ Return settings
                    Navigator.pop(context, {
                      'sound': _selectedSound,
                      'volume': _volume,
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

  Widget _buildSoundOption(String name, bool isSelected, bool isPremium) {
    return InkWell(
      onTap: () {
        setState(() => _selectedSound = name);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.shade200,
              width: 1,
            ),
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.volume_up_outlined,
              color:
                  isSelected ? AppColor.appColorPrimary : Colors.grey.shade700,
              size: 24,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                name,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: isSelected ? AppColor.appColorPrimary : Colors.black,
                ),
              ),
            ),
            if (isSelected && !isPremium)
              const Icon(
                Icons.check,
                color: AppColor.appColorPrimary,
                size: 24,
              )
            else if (isPremium)
              Icon(
                Icons.workspace_premium,
                color: Colors.orange.shade600,
                size: 24,
              ),
          ],
        ),
      ),
    );
  }
}

// ✅ Helper function - RETURN TIPINI TO'G'RILADIK
Future<Map<String, dynamic>?> showWhiteNoiseBottomSheet(BuildContext context) {
  return showModalBottomSheet<Map<String, dynamic>>(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (context) => const WhiteNoiseBottomSheet(),
  );
}
