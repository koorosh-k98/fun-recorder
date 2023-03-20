import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../states/record/providers/recording_timer_provider.dart';
import '../../states/settings/providers/custom_theme_provider.dart';

class TimerWidget extends ConsumerWidget {
  const TimerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double w = MediaQuery.of(context).size.width;
    final duration = ref.watch(recordingTimerProvider);
    return Container(
      width: w * 0.9,
      decoration: BoxDecoration(
          color: ref.watch(customThemeProvider).value?.cardColor,
          borderRadius: BorderRadius.circular(10),
          shape: BoxShape.rectangle),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            duration,
            style: const TextStyle(color: Colors.redAccent, fontSize: 40),
          ),
        ],
      ),
    );
  }
}