import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recorder/states/recorded_list/extentions/file_name.dart';
import 'package:recorder/states/recorded_list/extentions/human_readable_time.dart';
import 'package:recorder/states/recorded_list/providers/duration_provider.dart';
import '../../states/recorded_list/providers/recorded_list_provider.dart';

class RecordedListTab extends ConsumerWidget {
  const RecordedListTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recordedList = ref.watch(recordedListProvider);
    if (recordedList.isEmpty) {
      return const Center(
        child: Text("Not recorded yet"),
      );
    }
    return ListView.builder(
        itemCount: recordedList.length,
        itemBuilder: (context, index) {
          final recordedEntity = recordedList.elementAt(index);
          final duration =
              ref.watch(durationProvider(file: recordedEntity)).valueOrNull;
          return ListTile(
              style: ListTileStyle.list,
              title: Text(recordedEntity.path.fileName()),
              subtitle: Text(duration?.humanReadableTime() ?? ""),
              leading: const Icon(Icons.music_note),
              trailing: IconButton(
                  onPressed: () {
                    ref
                        .read(recordedListProvider.notifier)
                        .removeRecordedFile(recordedEntity.path.fileName());
                  },
                  icon: const Icon(Icons.delete)));
        });
  }
}
