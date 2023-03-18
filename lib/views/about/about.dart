import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/strings.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(Strings.about)),
      body: ListView(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(32, 8, 32, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: const [
                      // Icon(Icons.app_shortcut),
                      // SizedBox(
                      //   width: 15,
                      // ),
                      Text(
                        Strings.appName,
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.person,
                        color:Colors.orangeAccent,
                        size: 26,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        Strings.developerInfo,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.link,
                        color:Colors.orangeAccent,
                        size: 26,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          final url = Uri(
                              scheme: Strings.uriScheme,
                              host: Strings.uriHost,
                              path: Strings.uriPath);
                          launchUrl(url);
                        },
                        child: const Text(
                          Strings.githubLink,
                          style: TextStyle(
                              fontSize: 15,
                              decoration: TextDecoration.underline,
                              color: Colors.blue),
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Clipboard.setData(
                                  const ClipboardData(text: Strings.githubLink))
                              .then((_) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(Strings.githubLinkCopied)));
                          });
                        },
                        child: const Icon(
                          Icons.copy,
                          size: 26,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.email,
                        color:Colors.orangeAccent,
                        size: 26,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                          onTap: () {
                            Clipboard.setData(
                                    const ClipboardData(text: Strings.email))
                                .then((_) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(Strings.emailCopied)));
                            });
                          },
                          child: const Text(
                            Strings.email,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          )),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Clipboard.setData(
                                  const ClipboardData(text: Strings.email))
                              .then((_) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(Strings.emailCopied)));
                          });
                        },
                        child: const Icon(
                          Icons.copy,
                          size: 26,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.numbers,
                        color:Colors.orangeAccent,
                        size: 26,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        Strings.version,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
