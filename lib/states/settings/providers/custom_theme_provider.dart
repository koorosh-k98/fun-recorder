import 'package:flutter/material.dart';
import 'package:recorder/states/settings/models/themes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../helpers/shared_prefs.dart';

part 'custom_theme_provider.g.dart';

@riverpod
class CustomTheme extends _$CustomTheme {
  @override
  Future<Themes> build() {
    return  SharedPrefs.loadTheme()
        .then((isDark) => isDark ? Themes.dark : Themes.light);
  }

  toggle() async{
    bool isDark = state.value == Themes.dark;
    SharedPrefs.saveTheme(!isDark);
    state= AsyncValue.data( isDark ? Themes.light : Themes.dark);
  }

  set setTheme(Themes theme) {
    bool isDark = theme.mode == ThemeMode.dark;
    SharedPrefs.saveTheme(isDark);
    state = AsyncValue.data( isDark ? Themes.dark : Themes.light);
  }
}
