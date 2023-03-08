import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../states/record/models/play.dart';
import '../../states/record/providers/play_voice_provider.dart';

class PlayerButtons extends ConsumerWidget {
  const PlayerButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PlayState playState = ref.watch(playVoiceProvider);
    bool isPlaying =
        playState == PlayState.start || playState == PlayState.resume;
    Stream<double> positionStream =
        ref.read(playVoiceProvider.notifier).positionStream();
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        StreamBuilder<double>(
            stream: positionStream,
            builder: (context, snapshot) {
              return Slider(
                min: 0,
                max: 100,
                value: snapshot.data ?? 0,
                thumbColor: Colors.white,
                activeColor: Colors.yellow,
                inactiveColor: Colors.red,
                onChanged: (val) {
                  ref.read(playVoiceProvider.notifier).seekPlayer(val);
                },
              );
            }),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  if(isPlaying){
                    ref.read(playVoiceProvider.notifier).pausePlayer();
                  }else{
                    ref.read(playVoiceProvider.notifier).resumePlayer();
                  }
                },
                icon: Icon(
                  isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 50,
                  color: Colors.white,
                ))
          ],
        )
      ],
    );
  }
}
