import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:record/record.dart';

import '../../states/record/providers/record_audio_provider.dart';
import '../../states/settings/providers/custom_theme_provider.dart';
import '../constants/strings.dart';
import 'ampl.dart';

class AmplContainer extends ConsumerWidget {
  const AmplContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double w = MediaQuery.of(context).size.width;
    return Expanded(
        child: Center(
      child: Container(
        width: w * 0.9,
        height: 300,
        decoration: BoxDecoration(
            color: ref.watch(customThemeProvider).value?.cardColor,
            borderRadius: BorderRadius.circular(10),
            shape: BoxShape.rectangle),
        child: StreamBuilder<Amplitude>(
            stream: ref.read(recordAudioProvider.notifier).amplitudeStream(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Ampl(amplitude: snapshot.data);
              }
              if (snapshot.hasError) {
                return const Center(
                  child: Text(
                    Strings.amplitudeFailed,
                    style: TextStyle(color: Colors.red),
                  ),
                );
              } else {
                final amp = Amplitude(current: -30, max: -160);
                return Ampl(amplitude: amp);
              }
            }),
      ),
    ));
  }
}
