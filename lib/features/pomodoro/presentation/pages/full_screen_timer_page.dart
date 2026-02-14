import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pomodoro/core/constants/app_color.dart';

class FullScreenTimerPage extends StatefulWidget {
  final int initialMinutes;

  const FullScreenTimerPage({
    super.key,
    this.initialMinutes = 25,
  });

  @override
  State<FullScreenTimerPage> createState() => _FullScreenTimerPageState();
}

class _FullScreenTimerPageState extends State<FullScreenTimerPage> {
  late int minutes;
  int seconds = 0;
  bool isRunning = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    minutes = widget.initialMinutes;

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    _timer?.cancel();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else if (minutes > 0) {
          minutes--;
          seconds = 59;
        } else {
          _timer?.cancel();
          isRunning = false;
          _onTimerComplete();
        }
      });
    });
  }

  void _pauseTimer() {
    _timer?.cancel();
  }

  void _resetTimer() {
    _timer?.cancel();
    setState(() {
      minutes = widget.initialMinutes;
      seconds = 0;
      isRunning = false;
    });
  }

  void _onTimerComplete() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: const Text(
          '🎉 Session Complete!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: const Text(
          'Great work! Time for a break.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _resetTimer();
            },
            child: Center(
              child: const Text(
                'Start New Session',
                style: TextStyle(
                  color: AppColor.appColorPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _skipToBreak() {
    _timer?.cancel();
    setState(() {
      minutes = 5;
      seconds = 0;
      isRunning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1D2E),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildFlipCard((minutes ~/ 10).toString()),
                const SizedBox(width: 12),
                _buildFlipCard((minutes % 10).toString()),
                const SizedBox(width: 24),
                _buildFlipCard((seconds ~/ 10).toString()),
                const SizedBox(width: 12),
                _buildFlipCard((seconds % 10).toString()),
              ],
            ),
            Positioned(
              bottom: 240,
              left: 25,
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 20,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
            Positioned(
              top: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildControlButton(
                    icon: Icons.refresh,
                    onTap: _resetTimer,
                  ),
                  const SizedBox(width: 18),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: AppColor.appColorPrimary,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.appColorPrimary,
                          blurRadius: 30,
                          spreadRadius: -5,
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: Icon(
                        isRunning ? Icons.pause : Icons.play_arrow,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {
                        setState(() {
                          isRunning = !isRunning;

                          if (isRunning) {
                            _startTimer();
                          } else {
                            _pauseTimer();
                          }
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 18),
                  _buildControlButton(
                    icon: Icons.skip_next,
                    onTap: _skipToBreak,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFlipCard(String digit) {
    return Container(
      width: 160,
      height: 270,
      decoration: BoxDecoration(
        color: const Color(0xFF252A3F),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: 135,
            left: 0,
            right: 0,
            child: Container(
              height: 2,
              color: const Color(0xFF1A1D2E),
            ),
          ),
          Center(
            child: Text(
              digit,
              style: const TextStyle(
                fontSize: 170,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildControlButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(
          icon,
          color: Colors.white,
          size: 24,
        ),
        onPressed: onTap,
      ),
    );
  }
}
