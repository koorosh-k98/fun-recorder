import 'package:flutter/material.dart';
import 'package:recorder/views/record/record_tab.dart';

import '../constants/strings.dart';
import '../recorded_list/recorded_list_tab.dart';

class Tabs extends StatelessWidget {
  const Tabs({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(Strings.recorder),
          bottom: const TabBar(tabs: [
            Tab(text: Strings.record),
            Tab(text: Strings.recordedList),
          ]),
        ),
        body: const TabBarView(
          children: [
            RecordTab(),
            RecordedListTab(),
          ],
        ),
      ),
    );
  }
}
