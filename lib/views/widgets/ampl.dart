import 'package:flutter/material.dart';
import 'package:record/record.dart';
import 'package:recorder/views/constants/amplitude_consts.dart';

class Ampl extends StatelessWidget {
  Ampl({super.key, required this.amplitude}) {
    //limit amplitude to [decibelLimit]
    Amplitude amp = amplitude ?? Amplitude(current: 0, max: 0);
    double db = amp.current;
    // :AmplitudeConsts.decibelLimit;

    if (db == double.infinity || db < AmplitudeConsts.decibelLimit) {
      db = AmplitudeConsts.decibelLimit;
    }
    if (db > 0) {
      db = 0;
    }

    //this expression converts [db] to [0 to 1] double
    range = 1 - (db * (1 / AmplitudeConsts.decibelLimit));
    print(db);
  }

  final Amplitude? amplitude;
  final double maxHeight = 250;

  late final double range;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildBar(0.15),
        buildBar(0.5),
        buildBar(0.25),
        buildBar(0.75),
        buildBar(0.5),
        buildBar(1),
        buildBar(0.75),
        buildBar(0.5),
        buildBar(0.25),
        buildBar(0.5),
        buildBar(0.15),
      ],
    );
  }

  buildBar(double intensity) {
    double barHeight = range * maxHeight * intensity;
    if (barHeight < 5) {
      barHeight = 5;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 100,
        ),
        height: barHeight,
        width: 5,
        decoration: BoxDecoration(
          color: Colors.limeAccent,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              color: Colors.green,
              spreadRadius: 1,
              offset: Offset(1, 1),
            ),
            BoxShadow(
              color: Colors.blue,
              spreadRadius: 0.5,
              offset: Offset(-1, -1),
            ),
          ],
        ),
      ),
    );
  }
}
