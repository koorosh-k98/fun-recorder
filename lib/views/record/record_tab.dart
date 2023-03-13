import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:record/record.dart';
import 'package:recorder/views/record/record_buttons.dart';
import 'package:recorder/views/widgets/ampl.dart';

import '../../states/record/providers/record_audio_provider.dart';
import '../constants/strings.dart';

class RecordTab extends ConsumerWidget {
  const RecordTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double h = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
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
                    return const SizedBox();
                  }
                })),
        Container(
          padding: const EdgeInsets.all(8.0),
          height: h / 5,
          width: double.infinity,
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.deepPurpleAccent,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0)),
          ),
          child: const RecordButtons(),
        )
      ],
    );
  }
}
