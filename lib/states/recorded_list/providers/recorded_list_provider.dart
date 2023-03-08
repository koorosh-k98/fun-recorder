import 'dart:io';

import 'package:recorder/states/recorded_list/extensions/file_name.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../record/constants/paths.dart';

part 'recorded_list_provider.g.dart';

@Riverpod(keepAlive: true)
class RecordedList extends _$RecordedList {
  @override
  Iterable<FileSystemEntity> build() {
    return Directory(Paths.recording).listSync().reversed;
  }

  addRecordedFile(fileName) {
    final filePath = "${Paths.recording}/$fileName";
    FileSystemEntity file = File.fromUri(Uri.file(filePath));
    state = [file, ...state];
  }

  void removeRecordedFile(String fileName)async {
    final filePath = "${Paths.recording}/$fileName";
    FileSystemEntity file = File.fromUri(Uri.file(filePath));
    if (await file.exists()) {
      file.delete();
    }
    state = [
      for (final fn in state)
        if (fn.path.fileName() != fileName) fn,
    ];
  }
}
