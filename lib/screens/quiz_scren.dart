import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tajwid_apps/screens/components/button_effect.dart';

import '../config/theme.dart';
import 'components/button_container.dart';
import 'quiz/quiz_detail_screen.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 100,
        centerTitle: true,
        title: const Text("Quiz",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),
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
            const Text("Pilih Soal Quiz", style: TextStyle(fontSize: 20)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonClickUp(
                  click: () {
                    print("Quiz 1");
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const QuizDetail(0);
                    }));
                  },
                  child: const ButtonContainer(title: "Nun Mati"),
                ),
                const SizedBox(height: 10),
                ButtonClickUp(
                  click: () {
                    print("Quiz 2");
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const QuizDetail(1);
                    }));
                  },
                  child: const ButtonContainer(title: "Mim Mati"),
                ),
                const SizedBox(height: 10),
                ButtonClickUp(
                  click: () {
                    print("Quiz 3");
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const QuizDetail(2);
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
