import 'dart:io';

import 'package:just_audio/just_audio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/play.dart';

part 'play_voice_provider.g.dart';

@Riverpod(keepAlive: true)
class PlayVoice extends _$PlayVoice {
  final player = AudioPlayer();

  @override
  PlayState build() {
    return PlayState.stop;
  }

  set setPlayState(PlayState value) => state = value;

  startPlayer(FileSystemEntity file) async {
    Duration? duration = await player.setFilePath(file.path);
    player.play();
    setPlayState = PlayState.start;
  }

  stopPlayer() async {
    player.stop();
    setPlayState = PlayState.stop;
  }

  pausePlayer() async {
    player.pause();
    setPlayState = PlayState.pause;
  }

  resumePlayer() async {
    player.play();
    setPlayState = PlayState.resume;
  }

  seekPlayer(double value) async {
    final duration = value / 100 * player.duration!.inSeconds;
    await player.seek(Duration(seconds: duration.round()));
    resumePlayer();
  }

  Stream<double> positionValueStream() {
    Stream<double> position = player.positionStream.map((duration) {
      final d =
          player.duration!.inSeconds == 0 ? 1 : player.duration!.inSeconds;
      double p = duration.inSeconds / d * 100;
      if (p == 100.0 || player.duration!.inSeconds == 0) {
        setPlayState = PlayState.pause;
      }
      return p;
    });
    return position;
  }

  Stream<Duration> positionStream() {
    Stream<Duration> position = player.positionStream
        .map((duration) => Duration(seconds: duration.inSeconds));
    return position;
  }

  Stream<Duration> voiceDurationStream() {
    Stream<Duration> duration = player.durationStream.map((duration) {
      return duration?.inSeconds != null
          ? Duration(seconds: duration!.inSeconds)
          : Duration.zero;
    });
    return duration;
  }
}
