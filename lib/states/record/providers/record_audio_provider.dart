import 'dart:io';

import 'package:record/record.dart';
import 'package:recorder/states/record/models/recording.dart';
import 'package:recorder/states/record/providers/recording_path_provider.dart';
import 'package:recorder/states/recorded_list/providers/recorded_list_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../constants/paths.dart';

part 'record_audio_provider.g.dart';

@Riverpod(keepAlive: true)
class RecordAudio extends _$RecordAudio {
  final _record = Record();

  @override
  RecordingState build() {
    return RecordingState.stop;
  }

  set setRecording(RecordingState value) => state = value;

  startRecord() async {
      setRecording = RecordingState.start;
      Directory appFolder = Directory(Paths.recording);
      bool appFolderExists = await appFolder.exists();
      if (!appFolderExists) {
        await appFolder.create(recursive: true);
      }
      String? path = ref.read(recordingPathProvider);
      await _record.start(path: path);
  }

  stopRecord() async {
    await _record.stop();
    ref.invalidate(recordedListProvider);
    setRecording = RecordingState.stop;
  }

  pauseRecord() async {
    await _record.pause();
    setRecording = RecordingState.pause;
  }

  resumeRecord() async {
    await _record.resume();
    setRecording = RecordingState.resume;
  }
}
