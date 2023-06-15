import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tajwid_apps/screens/components/button_effect.dart';

import '../config/theme.dart';
import 'components/button_container.dart';

class MateriScreen extends StatelessWidget {
  const MateriScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 100,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: CircleAvatar(
            backgroundColor: primaryColor.withOpacity(0.2),
            foregroundColor: Colors.black,
            child: const Icon(Icons.keyboard_arrow_left),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: linearGradient,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/lafad.svg",
              color: primaryColor,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonClickUp(
                  click: () {
                    print("Materi 1");
                  },
                  child: const ButtonContainer(title: "Materi 1"),
                ),
                ButtonClickUp(
                  click: () {
                    print("Materi 2");
                  },
                  child: const ButtonContainer(title: "Materi 2"),
                ),
                ButtonClickUp(
                  click: () {
                    print("Materi 3");
                  },
                  child: const ButtonContainer(title: "Materi 3"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}