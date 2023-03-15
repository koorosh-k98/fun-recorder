import 'package:flutter/foundation.dart' show immutable;

@immutable
class RecordSettingsModel {
  final int bitRate;
  final int sampleRate;
  final int channel;

  const RecordSettingsModel(
      {required this.bitRate, required this.sampleRate, required this.channel});

  RecordSettingsModel copyWith({
    int? bitRate,
    int? sampleRate,
    int? channel,
  }) {
    return RecordSettingsModel(
        bitRate: bitRate ?? this.bitRate,
        sampleRate: sampleRate ?? this.sampleRate,
        channel: channel ?? this.channel);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecordSettingsModel &&
          other.bitRate == bitRate &&
          other.sampleRate == sampleRate &&
          other.channel == channel;

  @override
  int get hashCode => Object.hashAll(
        [
          bitRate,
          sampleRate,
          channel,
        ],
      );
}
