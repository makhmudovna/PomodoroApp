import 'package:flutter/material.dart';
import 'package:pomodoro/features/pomodoro/presentation/pages/full_screen_timer_page.dart';
import 'package:pomodoro/features/pomodoro/presentation/widgets/strict_mode_bottom_sheet.dart';
import 'package:pomodoro/features/pomodoro/presentation/widgets/time_mode_bottom_sheed.dart';
import 'package:pomodoro/features/pomodoro/presentation/widgets/white_noise_bottom_sheet.dart';

class StricMode extends StatelessWidget {
  final Function(Map<String, dynamic>?)? onWhiteNoiseChanged;

  const StricMode({
    super.key,
    this.onWhiteNoiseChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildItem(
            icon: Icons.error_outline,
            label: 'Strict Mode',
            onTap: () => _handleStrictMode(context),
          ),
          _buildItem(
            icon: Icons.hourglass_empty,
            label: 'Timer Mode',
            onTap: () => _handleTimerMode(context),
          ),
          _buildItem(
            icon: Icons.fullscreen,
            label: 'Full Screen',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FullScreenTimerPage(),
              ),
            ),
          ),
          _buildItem(
            icon: Icons.music_note,
            label: 'White Noise',
            onTap: () => _handleWhiteNoise(context),
          ),
        ],
      ),
    );
  }

  Future<void> _handleStrictMode(BuildContext context) async {
    final result = await showStrictModeBottomSheet(context);
    if (result != null) {
      print('✅ Strict Mode: $result');
    }
  }

  Future<void> _handleTimerMode(BuildContext context) async {
    final result = await showTimeModeBottomSheet(context);
    if (result != null) {
      print('✅ Timer Mode: ${result['mode']}');
      print('   Selected Index: ${result['selectedIndex']}');
    }
  }

  Future<void> _handleWhiteNoise(BuildContext context) async {
    final result = await showWhiteNoiseBottomSheet(context);

    if (onWhiteNoiseChanged != null) {
      onWhiteNoiseChanged!(result);
    }
  }

  Widget _buildItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(6),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Icon(icon),
              const SizedBox(height: 4),
              Text(label, style: const TextStyle(fontSize: 6.5)),
            ],
          ),
        ),
      ),
    );
  }
}
