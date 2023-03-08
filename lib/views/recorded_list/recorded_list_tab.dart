import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recorder/states/recorded_list/extentions/file_name.dart';
import 'package:recorder/states/recorded_list/extentions/human_readable_time.dart';
import 'package:recorder/states/recorded_list/providers/duration_provider.dart';
import 'package:recorder/views/constants/strings.dart';
import 'package:recorder/views/widgets/custom_alert_dialog.dart';
import '../../states/recorded_list/providers/recorded_list_provider.dart';
import '../widgets/custom_button.dart';

class RecordedListTab extends ConsumerWidget {
  const RecordedListTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
    return ListView.builder(
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
        });
  }
}
