import 'dart:async';

import 'package:recorder/states/recorded_list/extensions/human_readable_time.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recording_timer_provider.g.dart';

@Riverpod(keepAlive: true)
class RecordingTimer extends _$RecordingTimer {
  Timer? _timer;
  late Duration _duration;

  @override
  String build() {
    _duration = const Duration();
    return _duration.humanReadableTime(withMilliseconds: true);
  }

  startTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      _duration = Duration(milliseconds: timer.tick * 100);
      state = _duration.humanReadableTime(withMilliseconds: true);
    });
  }

  stopTimer() {
    _timer?.cancel();
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
    _timer?.cancel();
  }

  resetTimer() {
    _duration = const Duration();
    state = _duration.humanReadableTime(withMilliseconds: true);
  }
}
