import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:record/record.dart';
import 'package:recorder/states/settings/providers/custom_theme_provider.dart';
import 'package:recorder/views/record/record_buttons.dart';
import 'package:recorder/views/widgets/ampl.dart';

import '../../states/record/providers/record_audio_provider.dart';
import '../constants/strings.dart';

class RecordTab extends ConsumerWidget {
  const RecordTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child: Center(
          child: Container(
            width: w * 0.9,
            height: 300,
            decoration: BoxDecoration(
              color: ref.watch(customThemeProvider).value?.cardColor,
              borderRadius: BorderRadius.circular(10),
              shape: BoxShape.rectangle
            ),
            child: StreamBuilder<Amplitude>(
                stream:
                    ref.read(recordAudioProvider.notifier).amplitudeStream(),
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
        )),
        Container(
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.all(8),
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: ref.watch(customThemeProvider).value?.cardColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0)),
          ),
          child: const RecordButtons(),
        )
      ],
    );
  }
}
