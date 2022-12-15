import 'package:flutter/material.dart';
import 'package:recorder/screens/record.dart';
import 'package:recorder/screens/recorded_list.dart';

class TabScreen extends StatelessWidget {
  const TabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Recorder"),
          bottom: const TabBar(tabs: [
            Tab(text: "Record"),
            Tab(text: "Recorded List"),
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
