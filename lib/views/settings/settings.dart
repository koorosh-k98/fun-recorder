import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recorder/states/settings/constants/settings_consts.dart';
import 'package:recorder/states/settings/providers/custom_theme_provider.dart';
import 'package:recorder/states/settings/providers/record_settings_provider.dart';

import '../constants/strings.dart';

class Settings extends ConsumerWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeProvider = ref.watch(customThemeProvider);
    bool isDark = themeProvider.value?.mode == ThemeMode.dark;
    return Scaffold(
      appBar: AppBar(title: const Text(Strings.settings)),
      body: ListView(
        children: [
          SwitchListTile(
            activeColor: Colors.blue,
            title: const Text(Strings.dartTheme),
            value: isDark,
            secondary: Icon(themeProvider.value?.icon),
            onChanged: (value) {
              ref.read(customThemeProvider.notifier).toggle();
            },
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: const Text(
              "${Strings.bitRate}:",
              style: TextStyle(fontSize: 18),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 3),
                borderRadius: BorderRadius.circular(15)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<int>(
                  isExpanded: true,
                  iconSize: 36,
                  value: ref.watch(recordSettingsProvider).value?.bitRate,
                  items: SettingsConsts.bitRateList
                      .map((e) => DropdownMenuItem<int>(
                            value: e,
                            child: Text(e.toString()),
                          ))
                      .toList(),
                  onChanged: (bitRate) {
                    ref
                        .read(recordSettingsProvider.notifier)
                        .copyWith(bitRate: bitRate);
                  }),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: const Text(
              "${Strings.sampleRate}:",
              style: TextStyle(fontSize: 18),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 3),
                borderRadius: BorderRadius.circular(15)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<int>(
                  isExpanded: true,
                  iconSize: 36,
                  value: ref.watch(recordSettingsProvider).value?.sampleRate,
                  items: SettingsConsts.sampleRateList
                      .map((e) => DropdownMenuItem<int>(
                            value: e,
                            child: Text(e.toString()),
                          ))
                      .toList(),
                  onChanged: (sampleRate) {
                    ref
                        .read(recordSettingsProvider.notifier)
                        .copyWith(sampleRate: sampleRate);
                  }),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: const Text(
              "${Strings.channel}:",
              style: TextStyle(fontSize: 18),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 3),
                borderRadius: BorderRadius.circular(15)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<int>(
                  isExpanded: true,
                  iconSize: 36,
                  value: ref.watch(recordSettingsProvider).value?.channel,
                  items: SettingsConsts.channelList
                      .map((e) => DropdownMenuItem<int>(
                            value: e,
                            child: Text(e == 1 ? Strings.mono : Strings.stereo),
                          ))
                      .toList(),
                  onChanged: (channel) {
                    ref
                        .read(recordSettingsProvider.notifier)
                        .copyWith(channel: channel);
                  }),
            ),
          )
        ],
      ),
    );
  }
}
