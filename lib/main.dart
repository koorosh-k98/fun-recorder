import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recorder/views/about/about.dart';
import 'package:recorder/views/animations/custom_page_transition.dart';
import 'package:recorder/views/constants/strings.dart';
import 'package:recorder/views/settings/settings.dart';

import 'views/tabs_view/tabs_view.dart';

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
      initialRoute: "/${Strings.tabs}",
      onGenerateRoute: (route) => onGenerateRoute(route),
    );
  }

  Route onGenerateRoute(RouteSettings route) {
    switch (route.name) {
      case "/${Strings.tabs}":
        return CustomPageTransition(child: const Tabs());
      case "/${Strings.settings}":
        return CustomPageTransition(child: const Settings());
      case "/${Strings.about}":
        return CustomPageTransition(child: const About());
      default:
        return CustomPageTransition(child: const Tabs());
    }
  }
}
