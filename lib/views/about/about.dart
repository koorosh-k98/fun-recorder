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
      body: Stack(children: [
        Column(
          children: [
            Container(
              color: Colors.white,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(30)),
                ),
                width: double.infinity,
                height: 150,
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.deepPurple,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(30)),
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(32, 8, 32, 8),
                    child: ListView(
                      children: [
                        const SizedBox(
                          height: 75,
                        ),
                        Row(
                          children: const [
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
                              color: Colors.orangeAccent,
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
                              color: Colors.orangeAccent,
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
                                Clipboard.setData(const ClipboardData(
                                        text: Strings.githubLink))
                                    .then((_) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content:
                                              Text(Strings.githubLinkCopied)));
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
                              color: Colors.orangeAccent,
                              size: 26,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            GestureDetector(
                                onTap: () {
                                  Clipboard.setData(const ClipboardData(
                                          text: Strings.email))
                                      .then((_) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content:
                                                Text(Strings.emailCopied)));
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
                                Clipboard.setData(const ClipboardData(
                                        text: Strings.email))
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
                              color: Colors.orangeAccent,
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
                ),
              ),
            ),
          ],
        ),
        Positioned(
          top: 70,
          left: MediaQuery.of(context).size.width / 2,
          child: Container(
            width: 160,
            height: 160,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white),
          ),
        ),
        Positioned(
          top: 75,
          left: MediaQuery.of(context).size.width / 2 + 5,
          child: Container(
            width: 150,
            height: 150,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.red),
          ),
        ),
        Positioned(
          top: 95,
          left: MediaQuery.of(context).size.width / 2 + 28,
          child: SizedBox(
            width: 100,
            height: 100,
            child: Image.asset(
              "assets/images/logo.png",
              color: Colors.white,
            ),
          ),
        ),
      ]),
    );
  }
}
