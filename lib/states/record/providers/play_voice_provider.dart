import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/play.dart';

part 'play_voice_provider.g.dart';

@riverpod
class PlayVoice extends _$PlayVoice {
  @override
  PlayState build() {
    return PlayState.stop;
  }

  set setPlay(PlayState value) => state = value;

  startPlayer() async {
    setPlay = PlayState.start;
  }

  stopPlayer() async {
    setPlay = PlayState.stop;
  }

  pausePlayer() async {
    setPlay = PlayState.pause;
  }

  resumePlayer() async {
    setPlay = PlayState.resume;
  }
}
