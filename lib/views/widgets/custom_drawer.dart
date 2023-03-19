import 'package:flutter/material.dart';
import 'package:recorder/views/constants/strings.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            width: double.infinity,
            height: 250,
            color: Colors.deepPurple,
            child: Stack(
              children: [
                Center(
                  child: Container(
                    width: 145,
                    height: 145,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.blue),
                  ),
                ),
                Center(
                  child: Container(
                    width: 135,
                    height: 135,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.asset(
                      "assets/images/logo.png",
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed("/${Strings.settings}");
            },
            leading: const Icon(Icons.settings),
            title: const Text(
              Strings.settings,
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
          const Divider(),
          ListTile(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed("/${Strings.about}");
            },
            leading: const Icon(Icons.person),
            title: const Text(
              Strings.about,
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          )
        ],
      ),
    );
  }
}
