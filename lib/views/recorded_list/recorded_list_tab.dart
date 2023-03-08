import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:recorder/states/recorded_list/extensions/file_name.dart';
import 'package:recorder/views/recorded_list/voice_player.dart';

import '../../states/record/helpers/ask_permission_helper.dart';
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
    if (recordedList.isEmpty) {
      return const Center(
        child: Text(
          Strings.notRecordedYet,
          style: TextStyle(
            fontSize: 23,
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
                final duration =
                    ref.watch(durationProvider(file: recordedEntity)).valueOrNull;
                return Dismissible(
                    key: Key(recordedEntity.path.fileName()),
                    direction: DismissDirection.endToStart,
                    confirmDismiss: (direction) {
                      return const CustomAlertDialog(
                              title: Strings.doYouWantToDelete,
                              message: Strings.areYouSure,
                              buttons: {Strings.no: false, Strings.yes: true})
                          .present(context);
                    },
                    background: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Icon(
                            Icons.delete,
                            size: 35,
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
                      margin: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                          color: Colors.amberAccent),
                      child: ListTile(
                        style: ListTileStyle.list,
                        title: Text(recordedEntity.path.fileName()),
                        subtitle: Text(duration?.humanReadableTime() ?? ""),
                        leading: const Icon(
                          Icons.music_note,
                          size: 40,
                          color: Colors.blue,
                        ),
                      ),
                    ));
              }),
        ),
        const VoicePlayer()
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
