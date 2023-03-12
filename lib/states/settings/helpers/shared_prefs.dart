import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static const _iSDarkMode = "isDarkMode";

  static saveTheme(bool isDarkMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_iSDarkMode, isDarkMode);
  }

  static Future<bool> loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_iSDarkMode) ?? false;
  }
}
