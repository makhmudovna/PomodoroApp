import 'package:audioplayers/audioplayers.dart';

/// White Noise audio player service
/// Manages background sound playback
class WhiteNoisePlayer {
  static final WhiteNoisePlayer _instance = WhiteNoisePlayer._internal();
  factory WhiteNoisePlayer() => _instance;
  WhiteNoisePlayer._internal();

  final AudioPlayer _player = AudioPlayer();
  bool _isPlaying = false;
  String? _currentSound;

  /// Play a white noise sound
  Future<void> play(String soundName, double volume) async {
    try {
      // Stop current sound if playing
      if (_isPlaying) {
        await stop();
      }

      // Play new sound
      await _player.setVolume(volume / 100); // Convert 0-100 to 0.0-1.0
      await _player.setReleaseMode(ReleaseMode.loop); // Loop the sound

      // Load and play from assets
      await _player.play(
        AssetSource(
            'sounds/${soundName.toLowerCase().replaceAll(' ', '_')}.mp3'),
      );

      _isPlaying = true;
      _currentSound = soundName;

      print('🎵 Playing: $soundName at ${volume.toInt()}% volume');
    } catch (e) {
      print('❌ Error playing sound: $e');
    }
  }

  /// Stop playing sound
  Future<void> stop() async {
    try {
      await _player.stop();
      _isPlaying = false;
      _currentSound = null;
      print('⏹️ Sound stopped');
    } catch (e) {
      print('❌ Error stopping sound: $e');
    }
  }

  /// Pause sound
  Future<void> pause() async {
    try {
      await _player.pause();
      _isPlaying = false;
      print('⏸️ Sound paused');
    } catch (e) {
      print('❌ Error pausing sound: $e');
    }
  }

  /// Resume sound
  Future<void> resume() async {
    try {
      await _player.resume();
      _isPlaying = true;
      print('▶️ Sound resumed');
    } catch (e) {
      print('❌ Error resuming sound: $e');
    }
  }

  /// Change volume
  Future<void> setVolume(double volume) async {
    try {
      await _player.setVolume(volume / 100);
      print('🔊 Volume set to ${volume.toInt()}%');
    } catch (e) {
      print('❌ Error setting volume: $e');
    }
  }

  /// Get current state
  bool get isPlaying => _isPlaying;
  String? get currentSound => _currentSound;

  /// Dispose player
  void dispose() {
    _player.dispose();
  }
}
