import 'package:flutter/material.dart';
import 'package:recorder/screens/record.dart';
import 'package:recorder/screens/recorded_list.dart';

import '../constants/strings.dart';

class TabScreen extends StatelessWidget {
  const TabScreen({super.key});

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
            Record(),
            RecordedList(),
          ],
        ),
      ),
    );
  }
}
