import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recorder/states/settings/providers/custom_theme_provider.dart';
import 'package:recorder/views/record/record_buttons.dart';
import 'package:recorder/views/widgets/ampl_container.dart';

import '../widgets/timer_widget.dart';

class RecordTab extends ConsumerWidget {
  const RecordTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double w = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 25,
        ),
        const TimerWidget(),
        const AmplContainer(),
        Container(
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.all(8),
          height: 120,
          width: w * 0.9,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: ref.watch(customThemeProvider).value?.cardColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: const RecordButtons(),
        )
      ],
    );
  }
}
