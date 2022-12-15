import 'package:flutter/material.dart';

import 'screens/tab.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recorder',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const TabScreen(),
    );
  }
}
