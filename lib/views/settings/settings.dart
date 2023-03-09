import 'package:flutter/material.dart';

import '../constants/strings.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(Strings.settings)),
      body: ListView(
        children: [
          ListTile(
            title: const Text(Strings.dartTheme),
            trailing: Switch(value: false, onChanged: (value){},),
          )
        ],
      ),
    );
  }
}
