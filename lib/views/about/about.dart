import 'package:flutter/material.dart';

import '../constants/strings.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(Strings.about)),
      body: ListView(
        children: const [
          ListTile(
            title: Text(Strings.about),
          )
        ],
      ),
    );
  }
}
