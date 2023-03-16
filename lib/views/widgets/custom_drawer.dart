import 'package:flutter/material.dart';
import 'package:recorder/views/constants/strings.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 250,
            color: Colors.blue,
            child: Stack(
              children: [
                Center(
                  child: Container(
                    width: 165,
                    height: 165,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                  ),
                ),
                Center(
                  child: Container(
                    width: 155,
                    height: 155,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.red),
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.asset(
                      "assets/images/logo.png",
                      color: Colors.white,
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
