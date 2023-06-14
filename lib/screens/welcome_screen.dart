import 'package:flutter/material.dart';
import 'package:tajwid_apps/screens/components/remove_glow.dart';

import '../models/materi.dart';
import 'components/button_effect.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: FutureBuilder<List<Materi>>(
          future: Materi().getData(),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading");
            }
            String title = snapshot.data![0].title!;
            List<Body> data = snapshot.data![0].body!;
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: ScrollConfiguration(
                behavior: NoGlowScrollBehavior(),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ListTile(
                        title: Text(title,
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      Column(
                        children: List.generate(data.length, (index) {
                          Body body = data[index];
                          return ListTile(
                            title: Text(body.subTitle!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                            subtitle: Text(
                              body.description!,
                              textAlign: TextAlign.justify,
                            ),
                          );
                        }),
                      ),
                      Row(
                        children: [
                          ButtonClickUp(
                            child: const Text("Quiz"),
                            clicked: () {
                              print("QUIZ");
                            },
                          ),
                          ButtonClickUp(
                            child: const Text("Materi"),
                            clicked: () {
                              print("Materi");
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    ));
  }
}
