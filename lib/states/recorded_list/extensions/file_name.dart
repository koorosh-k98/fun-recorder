extension FileName on String {
  String fileName() {
    return split("/").last;
  }
}
