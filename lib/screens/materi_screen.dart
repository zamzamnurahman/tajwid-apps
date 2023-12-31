import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tajwid_apps/screens/components/button_effect.dart';
import 'package:tajwid_apps/screens/detail_materi/detail_materi_mimmati_screen.dart';
import 'package:tajwid_apps/screens/detail_materi/detail_materi_nunmati_screen.dart';
import 'package:tajwid_apps/screens/materi_hukum_mad_screen.dart';

import '../config/theme.dart';
import 'components/button_container.dart';

class MateriScreen extends StatelessWidget {
  const MateriScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Materi",
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
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
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const DetailMateriNunMatiScreen();
                    }));
                  },
                  child: const ButtonContainer(title: "Nun Mati"),
                ),
                ButtonClickUp(
                  click: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const DetailMateriMimMatiScreen();
                    }));
                  },
                  child: const ButtonContainer(title: "Mim Mati"),
                ),
                ButtonClickUp(
                  click: () {
                    print("Materi 3");
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const HukumMadScreen();
                    }));
                  },
                  child: const ButtonContainer(title: "Hukum Mad"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
