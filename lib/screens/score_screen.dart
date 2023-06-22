import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tajwid_apps/config/theme.dart';
import 'package:tajwid_apps/screens/welcome_screen.dart';

import 'components/button_effect.dart';

class ScoreScreen extends ConsumerWidget {
  const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: linearGradient,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  gradient: linearGradientLight,
                  borderRadius: BorderRadius.circular(25.0),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(2, 2),
                      blurRadius: 10,
                      spreadRadius: 3,
                      color: Colors.black.withOpacity(0.1),
                    )
                  ],
                  border: Border.all(
                    color: primaryColor,
                  )),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("SCORE", style: TextStyle(fontSize: 24)),
                  Text("80",
                      style: TextStyle(
                        fontSize: 56,
                        fontWeight: FontWeight.bold,
                      ))
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ButtonClickUp(
                click: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const WelcomeScreen(),
                      ),
                      (route) => false);
                },
                child: Container(
                  decoration: BoxDecoration(
                    gradient: linearGradientLight,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const ListTile(
                    title:
                        Text("Kembali ke Home ", textAlign: TextAlign.center),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
