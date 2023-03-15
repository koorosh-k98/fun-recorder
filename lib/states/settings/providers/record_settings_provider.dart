import 'package:recorder/states/settings/helpers/shared_prefs.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/record_seetings_model.dart';

part 'record_settings_provider.g.dart';

@Riverpod(keepAlive: true)
class RecordSettings extends _$RecordSettings {
  late RecordSettingsModel recordSettingsModel;

  @override
  Future<RecordSettingsModel> build() async {
    recordSettingsModel = await loadRecordSettingsModel();
    return recordSettingsModel;
  }

  Future<RecordSettingsModel> copyWith({
    int? bitRate,
    int? sampleRate,
    int? channel,
  }) async {
    bitRate != null ? await SharedPrefs.setBitRate(bitRate) : null;
    sampleRate != null ? await SharedPrefs.setSampleRate(sampleRate) : null;
    channel != null ? await SharedPrefs.setChannel(channel) : null;

    bitRate = await SharedPrefs.getBitRate();
    sampleRate = await SharedPrefs.getSampleRate();
    channel = await SharedPrefs.getChannel();

    state = AsyncValue.data(recordSettingsModel.copyWith(
      bitRate: bitRate,
      sampleRate: sampleRate,
      channel: channel,
    ));
    return recordSettingsModel;
  }

  Future<RecordSettingsModel> loadRecordSettingsModel() async {
    int bitRate = await SharedPrefs.getBitRate();
    int sampleRate = await SharedPrefs.getSampleRate();
    int channel = await SharedPrefs.getChannel();
    return RecordSettingsModel(
        bitRate: bitRate, sampleRate: sampleRate, channel: channel);
  }
}
