import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../states/record/providers/is_recording_provider.dart';

class RecordButtons extends ConsumerWidget {
  const RecordButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isRecording = ref.watch(recordProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isRecording)
          Row(
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    Icons.pause,
                    size: 90,
                    color: Colors.orange,
                  ),
                  onPressed: ref.read(recordProvider.notifier).pauseRecord,
                ),
              ),
              SizedBox(
                height: 100,
                width: 100,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    Icons.stop,
                    size: 90,
                    color: Colors.red,
                  ),
                    onPressed: ref.read(recordProvider.notifier).stopRecord,
                ),
              )
            ],
          )
        else
          SizedBox(
            height: 100,
            width: 100,
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(
                Icons.play_arrow,
                size: 90,
                color: Colors.green,
              ),
              onPressed: ref.read(recordProvider.notifier).startRecord,
            ),
          )
      ],
    );
  }
}
