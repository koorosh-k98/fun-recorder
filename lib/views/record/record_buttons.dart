import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:recorder/states/record/models/recording.dart';
import 'package:recorder/views/widgets/custom_alert_dialog.dart';
import 'package:recorder/views/widgets/custom_button.dart';

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
                    size: 40,
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
                    size: 40,
                    color: Colors.green,
                  ),
                  onPressed:
                      ref.read(recordAudioProvider.notifier).resumeRecord,
                ),
              ),
            if (recordingState != RecordingState.stop)
              SizedBox(
                height: 100,
                width: 100,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    Icons.stop,
                    size: 80,
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
                  size: 80,
                  color: Colors.green,
                ),
                onPressed: () async {
                  bool isGranted = await AskPermissionHelper
                      .askStorageAndMicrophonePermission();
                  if (isGranted) {
                    ref.read(recordAudioProvider.notifier).startRecord();
                  } else {
                    if (context.mounted) {
                      final result = await const CustomAlertDialog(
                          title: Strings.accessRequired,
                          message: Strings.notHavingAccess,
                          buttons: {
                            Strings.goToSettings: true,
                            Strings.closeTheApp: false
                          }).present(context).then((value) => value ?? false);
                      result ? openAppSettings() : SystemNavigator.pop();
                    }
                  }
                }),
          )
      ],
    );
  }
}
