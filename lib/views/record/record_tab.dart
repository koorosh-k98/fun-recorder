import 'package:flutter/material.dart';
import 'package:recorder/views/record/record_buttons.dart';

import '../constants/strings.dart';

class RecordTab extends StatelessWidget {
  const RecordTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Column(
      children: [
        const Expanded(child: Text(Strings.record)),
        Container(
          padding: const EdgeInsets.all(8.0),
          height: h / 4,
          width: double.infinity,
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.deepPurpleAccent,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0)),
          ),
          child: const RecordButtons(),
        )
      ],
    );
  }
}
