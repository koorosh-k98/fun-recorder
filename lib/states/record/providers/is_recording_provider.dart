import 'package:recorder/states/record/typedef/is_recording.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_recording_provider.g.dart';

@riverpod
class Record extends _$Record {
  @override
  IsRecording build() {
    return false;
  }

  set isRecording(IsRecording value) => state = value;

  startRecord() {
    isRecording = true;
  }

  stopRecord() {
    isRecording = false;
  }

  pauseRecord() {
    isRecording = false;
  }
}
