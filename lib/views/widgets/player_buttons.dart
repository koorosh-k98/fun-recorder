import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../states/record/models/play.dart';
import '../../states/record/providers/play_voice_provider.dart';
import '../../states/recorded_list/extensions/human_readable_time.dart';
import '../../states/settings/providers/custom_theme_provider.dart';

class PlayerButtons extends ConsumerWidget {
  const PlayerButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PlayState playState = ref.watch(playVoiceProvider);
    bool isPlaying =
        playState == PlayState.start || playState == PlayState.resume;
    Stream<double> positionValueStream =
        ref.read(playVoiceProvider.notifier).positionValueStream();
    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        StreamBuilder<double>(
            stream: positionValueStream,
            builder: (context, snapshot) {
              return Slider(
                min: 0,
                max: 100,
                value: snapshot.data ?? 0.0,
                thumbColor:  ref.watch(customThemeProvider).value?.activeColor,
                activeColor: ref.watch(customThemeProvider).value?.activeColor,
                inactiveColor:
                    ref.watch(customThemeProvider).value?.inactiveColor,
                onChanged: (val) {
                  ref.read(playVoiceProvider.notifier).seekPlayer(val);
                },
              );
            }),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            StreamBuilder<Duration>(
                stream: ref.read(playVoiceProvider.notifier).positionStream(),
                builder: (context, snapshot) {
                  return Text(
                    snapshot.data != null
                        ? snapshot.data!.humanReadableTime()
                        : "00:00",
                    style: TextStyle(
                        fontSize: 18,
                        color: ref.watch(customThemeProvider).value?.color),
                  );
                }),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                if (isPlaying) {
                  ref.read(playVoiceProvider.notifier).pausePlayer();
                } else {
                  ref.read(playVoiceProvider.notifier).resumePlayer();
                }
              },
              icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 50, color: ref.watch(customThemeProvider).value?.color),
            ),
            StreamBuilder<Duration>(
                stream:
                    ref.read(playVoiceProvider.notifier).voiceDurationStream(),
                builder: (context, snapshot) {
                  return Text(
                      snapshot.data != null
                          ? snapshot.data!.humanReadableTime()
                          : "00:00",
                      style: TextStyle(
                          fontSize: 18,
                          color: ref.watch(customThemeProvider).value?.color));
                }),
          ],
        )
      ],
    );
  }
}
