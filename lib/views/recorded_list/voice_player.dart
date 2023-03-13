import 'package:flutter/material.dart';
import 'package:recorder/views/widgets/player_buttons.dart';

class VoicePlayer extends StatelessWidget {
  const VoicePlayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      height: h / 6,
      width: double.infinity,
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.deepPurpleAccent,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0)),
      ),
      child: const PlayerButtons(),
    );
  }
}
