import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recorder/views/constants/strings.dart';

import 'views/tabs/tabs.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.recorder,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const Tabs(),
    );
  }
}
