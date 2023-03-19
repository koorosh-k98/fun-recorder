import 'dart:async';

import 'package:recorder/states/recorded_list/extensions/human_readable_time.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recording_timer_provider.g.dart';

@riverpod
class RecordingTimer extends _$RecordingTimer {
  late Timer _timer;
  Duration _duration = const Duration();

  @override
  String build() {
    return Duration.zero.humanReadableTime(withMilliseconds: true);
  }

  startTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      _duration = Duration(milliseconds: timer.tick * 100);
      state = _duration.humanReadableTime(withMilliseconds: true);
    });
  }

  stopTimer() {
    _timer.cancel();
    resetTimer();
  }

  resumeTimer() {
    Duration passedDuration = _duration;
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      _duration = passedDuration + Duration(milliseconds: timer.tick * 100);
      state = _duration.humanReadableTime(withMilliseconds: true);
    });
  }

  pauseTimer() {
    _timer.cancel();
  }

  resetTimer() {
    _duration = const Duration();
    state = _duration.humanReadableTime(withMilliseconds: true);
  }
}
