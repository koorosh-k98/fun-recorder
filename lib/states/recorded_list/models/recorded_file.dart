import 'dart:io';

class RecordedFile {
  final FileSystemEntity file;
  final Duration fileDuration;

  RecordedFile({required this.file, required this.fileDuration});
}
