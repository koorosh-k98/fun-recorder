extension HumanReadableTime on Duration {
  String humanReadableTime({withMilliseconds = false}) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitHours = twoDigits(inHours);
    String twoDigitMinutes = twoDigits(inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(inSeconds.remainder(60));
    if (withMilliseconds) {
      String twoDigitMilliseconds = twoDigits((inMilliseconds~/10).remainder(100));
      return "$twoDigitHours:$twoDigitMinutes:$twoDigitSeconds:$twoDigitMilliseconds";
    }
    return "$twoDigitHours:$twoDigitMinutes:$twoDigitSeconds";
  }
}
