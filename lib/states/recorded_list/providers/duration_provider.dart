import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'duration_provider.g.dart';

@riverpod
Future<Duration> duration(Ref ref, {required FileSystemEntity file}) async {
  final player = AudioPlayer();
  final duration = await player.setFilePath(file.path) ?? Duration.zero;
  return duration;
}
