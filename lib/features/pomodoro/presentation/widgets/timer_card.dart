import 'dart:math';
import 'package:flutter/material.dart';

class _TimerCardState extends State<TimerCard>
    with SingleTickerProviderStateMixin {
  static const totalSeconds = 25 * 60;

  late AnimationController controller;
  bool running = false;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: totalSeconds),
    )
      ..addListener(() {
        setState(() {}); // smooth ticking
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            running = false; // Reset running state when animation completes
          });
        }
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void start() {
    controller.forward();
    setState(() {
      running = true;
    });
  }

  void pause() {
    controller.stop();
    setState(() {
      running = false;
    });
  }

  void repeat() {
    controller.reset();
    setState(() {
      running = false;
    });
  }

  void resetAndStart() {
    controller.reset();
    controller.forward();
    setState(() {
      running = true;
    });
  }

  String timeText() {
    final remain = (totalSeconds * (1 - controller.value)).ceil();

    final m = remain ~/ 60;
    final s = remain % 60;

    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 20)],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 230,
            width: 230,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomPaint(
                  size: const Size(230, 230),
                  painter: DialPainter(controller.value),
                ),

                /// ===== CENTER CONTENT =====
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.timer_outlined,
                      color: Colors.grey,
                      size: 22,
                    ),

                    const SizedBox(height: 6),

                    Text(
                      timeText(),
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    /// page dots
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        6,
                        (i) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 3),
                          width: 5,
                          height: 5,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: i == 0 ? Colors.red : Colors.grey.shade300,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),
                    Text(
                      running ? "Running" : "Start",
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),

          /// ===== BUTTONS =====
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _softButton(Icons.replay, resetAndStart),
              const SizedBox(width: 24),
              GestureDetector(
                onTap: running ? pause : start,
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: Icon(
                    running ? Icons.pause : Icons.play_arrow,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              _softButton(Icons.skip_next, () {}),
            ],
          ),
        ],
      ),
    );
  }

  Widget _softButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.grey.shade600),
      ),
    );
  }
}

class DialPainter extends CustomPainter {
  final double progress;

  DialPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    const stroke = 18.0;
    final radius = size.width / 2 - stroke;

    final startAngle = pi * 0.75;
    final sweepTotal = pi * 1.5;

    /// ticks - made larger and with more space from red line
    final tickPaint = Paint()
      ..color = Colors.grey.shade400
      ..strokeWidth = 3.0; // Increased from 2 to 3 for larger ticks

    for (int i = 0; i < 17; i++) {
      final angle = startAngle + (i / 17) * sweepTotal;

      // Increased distance from center (radius - 16) and made tick longer (radius - 2)
      final p1 = Offset(
        center.dx +
            (radius - 14) * cos(angle), // Changed from 12 to 16 for more space
        center.dy + (radius - 14) * sin(angle),
      );

      final p2 = Offset(
        center.dx + (radius - 4) * cos(angle), // Changed from 2 to 4
        center.dy + (radius - 4) * sin(angle),
      );

      canvas.drawLine(p1, p2, tickPaint);
    }

    final bg = Paint()
      ..color = Colors.grey.shade300
      ..strokeWidth = stroke
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepTotal,
      false,
      bg,
    );

    /// red progress - FIXED: now follows time correctly
    final fg = Paint()
      ..color = Colors.red
      ..strokeWidth = stroke
      ..style = PaintingStyle.stroke // Fix: Changed ':' to '=' and added ';'
      ..strokeCap = StrokeCap.round;

    // Changed from (1 - progress) to just progress
    // This makes the red line decrease as time passes
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepTotal * progress, // Changed from (1 - progress) to progress
      false,
      fg,
    );
  }

  @override
  bool shouldRepaint(covariant DialPainter old) => old.progress != progress;
}

class TimerCard extends StatefulWidget {
  const TimerCard({super.key});

  @override
  State<TimerCard> createState() => _TimerCardState();
}
