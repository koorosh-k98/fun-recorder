import 'package:flutter/material.dart';
import 'package:recorder/views/record/record_tab.dart';
import 'package:recorder/views/widgets/custom_drawer.dart';

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
          title: const Text(Strings.appName),
          bottom: const TabBar(tabs: [
            Tab(text: Strings.record, icon: Icon(Icons.mic)),
            Tab(text: Strings.recordedList, icon: Icon(Icons.list)),
          ]),
        ),
        body: const TabBarView(
          children: [
            RecordTab(),
            RecordedListTab(),
          ],
        ),
        drawer: const CustomDrawer(),
      ),
    );
  }
}
