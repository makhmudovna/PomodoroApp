import 'package:flutter/material.dart';

class StricMode extends StatelessWidget {
  const StricMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 4),
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
            onTap: () {}
          ),
          _buildItem(
            icon: Icons.hourglass_empty,
            label: 'Timer Mode',
            onTap: () {},
          ),
          _buildItem(
            icon: Icons.fullscreen,
            label: 'Full Screen',
            onTap: () {},
          ),
          _buildItem(
            icon: Icons.music_note,
            label: 'White Noise',
            onTap: () {},
          ),
        ],
      ),
    );
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
