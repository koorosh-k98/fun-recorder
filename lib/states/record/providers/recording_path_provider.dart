import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../constants/paths.dart';

part 'recording_path_provider.g.dart';

@riverpod
String recordingPath(RecordingPathRef ref)  {
  String filepath = '${Paths.recording}/${DateTime.now().millisecondsSinceEpoch}.m4a';
  return filepath;
}
