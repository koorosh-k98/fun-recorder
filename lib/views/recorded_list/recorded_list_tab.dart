import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:recorder/states/record/providers/play_voice_provider.dart';
import 'package:recorder/states/record/providers/record_audio_provider.dart';
import 'package:recorder/states/recorded_list/extensions/file_name.dart';
import 'package:recorder/states/recorded_list/extensions/human_readable_size.dart';
import 'package:recorder/states/settings/providers/custom_theme_provider.dart';
import 'package:recorder/views/recorded_list/voice_player.dart';
import 'package:recorder/views/widgets/rename_dialog.dart';

import '../../states/record/helpers/ask_permission_helper.dart';
import '../../states/record/models/play.dart';
import '../../states/recorded_list/providers/duration_provider.dart';
import '../../states/recorded_list/providers/recorded_list_provider.dart';
import '../constants/strings.dart';
import '../widgets/custom_alert_dialog.dart';
import '../../states/recorded_list/extensions/human_readable_time.dart';

class RecordedListTab extends ConsumerStatefulWidget {
  const RecordedListTab({Key? key}) : super(key: key);

  @override
  ConsumerState<RecordedListTab> createState() => _RecordedListTabState();
}

class _RecordedListTabState extends ConsumerState<RecordedListTab> {
  @override
  void initState() {
    super.initState();
    askPermission();
  }

  @override
  Widget build(BuildContext context) {
    final recordedList = ref.watch(recordedListProvider);
    PlayState playerState = ref.watch(playVoiceProvider);
    if (recordedList.isEmpty) {
      return const Center(
        child: Text(
          Strings.notRecordedYet,
          style: TextStyle(
            fontSize: 21,
          ),
        ),
      );
    }
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              itemCount: recordedList.length,
              itemBuilder: (context, index) {
                final recordedEntity = recordedList.elementAt(index);
                final fileSize = recordedEntity.statSync().size;
                final duration = ref
                    .watch(durationProvider(file: recordedEntity))
                    .valueOrNull;
                return GestureDetector(
                  onTap: () {
                    ref
                        .read(playVoiceProvider.notifier)
                        .startPlayer(recordedEntity);
                  },
                  child: Dismissible(
                      key: Key(recordedEntity.path.fileName()),
                      direction: DismissDirection.endToStart,
                      confirmDismiss: (direction) async {
                        final result = const CustomAlertDialog(
                                title: Strings.doYouWantToDelete,
                                message: Strings.areYouSure,
                                buttons: {Strings.no: false, Strings.yes: true})
                            .present(context);
                        if (await result == true) {
                          ref.read(playVoiceProvider.notifier).stopPlayer();
                        }
                        return result;
                      },
                      background: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Icon(
                              Icons.delete,
                              size: 33,
                              color: Colors.deepOrange,
                            ),
                          ),
                        ],
                      ),
                      onDismissed: (direction) {
                        ref
                            .read(recordedListProvider.notifier)
                            .removeRecordedFile(recordedEntity.path.fileName());
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30)),
                            color: ref
                                .watch(customThemeProvider)
                                .value
                                ?.cardColor),
                        child: ListTile(
                          style: ListTileStyle.list,
                          title: Text(
                            recordedEntity.path.fileName(),
                            style: TextStyle(
                              fontSize: 17,
                              color: ref
                                  .watch(customThemeProvider)
                                  .value
                                  ?.textColor,
                            ),
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                duration?.humanReadableTime() ?? "",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: ref
                                      .watch(customThemeProvider)
                                      .value
                                      ?.textColor,
                                ),
                              ),
                              Text(
                                fileSize.humanReadableSize(),
                                style: TextStyle(
                                  fontSize: 14,
                                  color: ref
                                      .watch(customThemeProvider)
                                      .value
                                      ?.textColor,
                                ),
                              ),
                            ],
                          ),
                          leading: const Icon(
                            Icons.music_note,
                            size: 35,
                            color: Colors.redAccent,
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.edit,
                              size: 30,
                              color: ref
                                  .watch(customThemeProvider)
                                  .value
                                  ?.textColor,
                            ),
                            onPressed: () async {
                              final result = await RenameDialog(
                                      title: Strings.rename,
                                      file: recordedEntity,
                                      buttons: const {
                                    Strings.cancel: false,
                                    Strings.ok: true
                                  })
                                  .present(context)
                                  .then((value) => value ?? false);
                              if (result) {
                                ref.invalidate(recordedListProvider);
                              }
                            },
                          ),
                        ),
                      )),
                );
              }),
        ),
        if (playerState != PlayState.stop) const VoicePlayer()
      ],
    );
  }

  void askPermission() async {
    bool isGranted = await AskPermissionHelper.askStoragePermission();
    if (!isGranted && context.mounted) {
      final result = await const CustomAlertDialog(
              title: Strings.accessRequired,
              message: Strings.notHavingAccess,
              buttons: {Strings.goToSettings: true, Strings.closeTheApp: false})
          .present(context)
          .then((value) => value ?? false);
      result ? openAppSettings() : SystemNavigator.pop();
    }
  }
}
