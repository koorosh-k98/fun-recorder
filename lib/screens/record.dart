import 'package:flutter/material.dart';

class Record extends StatelessWidget {
  const Record({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Column(
      children: [
        const Expanded(child: Text("record")),
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.deepPurpleAccent,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0)),
          ),
          height: h / 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (1 == 2)
                SizedBox(
                  height: 100,
                  width: 100,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(
                      Icons.play_arrow,
                      size: 90,
                      color: Colors.green,
                    ),
                    onPressed: () {},
                  ),
                )
              else
                Row(
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(
                          Icons.pause,
                          size: 90,
                          color: Colors.orange,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(
                          Icons.stop,
                          size: 90,
                          color: Colors.red,
                        ),
                        onPressed: () {},
                      ),
                    )
                  ],
                )
            ],
          ),
        )
      ],
    );
  }
}
