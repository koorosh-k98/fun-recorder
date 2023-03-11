import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recorder/states/settings/providers/custom_theme_provider.dart';

import '../../states/settings/models/themes.dart';
import '../constants/strings.dart';

class Settings extends ConsumerWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeProvider = ref.watch(customThemeProvider);
    bool isDark = themeProvider.mode == ThemeMode.dark;
    return Scaffold(
      appBar: AppBar(title: const Text(Strings.settings)),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text(Strings.dartTheme),
            value: isDark,
            secondary: Icon(themeProvider.icon),
            onChanged: (value) {
              ref.read(customThemeProvider.notifier).toggle();
            },
          )
        ],
      ),
    );
  }
}
