import 'package:recorder/states/settings/constants/settings_consts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static const _isDarkMode = "isDarkMode";
  static const _bitRate = "bitRate";
  static const _sampleRate = "sampleRate";
  static const _channel = "channel";

  static saveTheme(bool isDarkMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_isDarkMode, isDarkMode);
  }

  static setBitRate(int bitRate) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(_bitRate, bitRate);
  }

  static setSampleRate(int sampleRate) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(_sampleRate, sampleRate);
  }

  static setChannel(int channel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(_channel, channel);
  }

  static Future<bool> loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isDarkMode) ?? false;
  }

  static Future<int> getBitRate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_bitRate) ?? SettingsConsts.bitRate;
  }

  static Future<int> getSampleRate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_sampleRate) ?? SettingsConsts.sampleRate;
  }

  static Future<int> getChannel() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_channel) ?? SettingsConsts.channel;
  }
}
