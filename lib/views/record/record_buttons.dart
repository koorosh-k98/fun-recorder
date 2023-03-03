import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:recorder/states/record/models/recording.dart';
import 'package:recorder/views/custom_button/custom_button.dart';

import '../../states/record/helpers/ask_permission_helper.dart';
import '../../states/record/providers/record_audio_provider.dart';
import '../constants/strings.dart';

class RecordButtons extends ConsumerWidget {
  const RecordButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    RecordingState recordingState = ref.watch(recordAudioProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            if (recordingState == RecordingState.resume ||
                recordingState == RecordingState.start)
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
                  onPressed: ref.read(recordAudioProvider.notifier).pauseRecord,
                ),
              ),
            if (recordingState == RecordingState.pause)
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
                  onPressed:
                      ref.read(recordAudioProvider.notifier).resumeRecord,
                ),
              ),
            if (recordingState == RecordingState.resume ||
                recordingState == RecordingState.pause ||
                recordingState == RecordingState.start)
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
                  onPressed: ref.read(recordAudioProvider.notifier).stopRecord,
                ),
              )
          ],
        ),
        if (recordingState == RecordingState.stop)
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
                onPressed: () async {
                  bool isGranted = await AskPermissionHelper
                      .askStorageAndMicrophonePermission();
                  if (isGranted) {
                    ref.read(recordAudioProvider.notifier).startRecord();
                  } else {
                    if (context.mounted) {
                      showAlertDialog(context, Strings.notHavingAccess);
                    }
                  }
                }),
          )
      ],
    );
  }

  showAlertDialog(context, String msg) {
    showDialog(
        context: context,
        builder: (ctx) => Dialog(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.warning_rounded,
                      size: 40,
                      color: Colors.amber,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      msg,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          SystemNavigator.pop();
                        },
                        color: Colors.red,
                        child: const Text(
                          Strings.closeTheApp,
                          style: TextStyle(color: Colors.white),
                        )),
                    const SizedBox(
                      height: 12,
                    ),
                    CustomButton(
                        onPressed: () {
                          openAppSettings();
                          Navigator.of(context).pop();
                        },
                        color: Colors.green,
                        child: const Text(
                          Strings.goToSettings,
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                ),
              ),
            ));
  }
}
