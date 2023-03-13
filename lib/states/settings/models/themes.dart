import 'package:flutter/material.dart';

import '../../../views/constants/strings.dart';

enum Themes {
  dark(
    mode: ThemeMode.dark,
    name: Strings.darkName,
    icon: Icons.dark_mode,
    color: Colors.white,
    textColor: Colors.white,
    cardColor: Colors.black26,
  ),
  light(
    mode: ThemeMode.light,
    name: Strings.lightName,
    icon: Icons.light_mode,
    color: Colors.black,
    textColor: Colors.black,
    cardColor: Colors.white,
  );

  final ThemeMode mode;
  final String name;
  final IconData icon;
  final Color color;
  final Color textColor;
  final Color cardColor;

   const Themes({
    required this.mode,
    required this.name,
    required this.icon,
    required this.color,
    required this.textColor,
    required this.cardColor,
  });
}
