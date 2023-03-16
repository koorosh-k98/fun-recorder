import 'dart:math';

extension HumanReadableSize on int {
  String humanReadableSize() {
    const suffixes = [" B", " kB", " mB", " gB", " tB"];
    if (this == 0) return '0${suffixes[0]}';
    var i = (log(this) / log(1024)).floor();
    return (((this / pow(1024, i)).toStringAsFixed(2)) + suffixes[i]).toString();
  }
}
