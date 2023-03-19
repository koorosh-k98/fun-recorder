import 'dart:io';

import 'package:record/record.dart';
import 'package:recorder/states/record/models/recording.dart';
import 'package:recorder/states/record/providers/recording_path_provider.dart';
import 'package:recorder/states/record/providers/recording_timer_provider.dart';
import 'package:recorder/states/recorded_list/providers/recorded_list_provider.dart';
import 'package:recorder/states/settings/providers/record_settings_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../settings/constants/settings_consts.dart';
import '../../settings/models/record_seetings_model.dart';
import '../constants/paths.dart';

part 'record_audio_provider.g.dart';

@Riverpod(keepAlive: true)
class RecordAudio extends _$RecordAudio {
  final _record = Record();

  @override
  RecordingState build() {
    return RecordingState.stop;
  }

  set setRecordingState(RecordingState value) => state = value;

  startRecord() async {
    setRecordingState = RecordingState.start;
    Directory appFolder = Directory(Paths.recording);
    bool appFolderExists = await appFolder.exists();
    if (!appFolderExists) {
      await appFolder.create(recursive: true);
    }
    String? path = ref.read(recordingPathProvider);
    RecordSettingsModel? settings = ref.read(recordSettingsProvider).value;
    int bitRate = settings?.bitRate ?? SettingsConsts.bitRate;
    int sampleRate = settings?.sampleRate ?? SettingsConsts.sampleRate;
    int channel = settings?.channel ?? SettingsConsts.channel;

    await _record.start(
        path: path,
        bitRate: bitRate,
        samplingRate: sampleRate,
        numChannels: channel
        );
    ref.read(recordingTimerProvider.notifier).startTimer();
  }

  stopRecord() async {
    await _record.stop();
    ref.invalidate(recordedListProvider);
    setRecordingState = RecordingState.stop;
    ref.read(recordingTimerProvider.notifier).stopTimer();
  }

  pauseRecord() async {
    await _record.pause();
    setRecordingState = RecordingState.pause;
    ref.read(recordingTimerProvider.notifier).pauseTimer();
  }

  resumeRecord() async {
    await _record.resume();
    setRecordingState = RecordingState.resume;
    ref.read(recordingTimerProvider.notifier).resumeTimer();
  }

  Stream<Amplitude> amplitudeStream() {
    return _record.onAmplitudeChanged(const Duration(milliseconds: 100));
  }
}
