import 'package:recorder/states/settings/models/themes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'custom_theme_provider.g.dart';

@riverpod
class CustomTheme extends _$CustomTheme {
  @override
  Themes build() {
    return Themes.dark;
  }

  toggle() {
    state = state == Themes.dark ? Themes.light : Themes.dark;
  }
}
