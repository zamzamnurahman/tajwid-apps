import 'package:flutter/material.dart';

import '../../config/theme.dart';
import 'button_effect.dart';

class ButtonSoal extends StatelessWidget {
  final int number;
  final PageController pageController;
  const ButtonSoal({
    super.key,
    required this.number,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonClickUp(
      click: () {
        pageController
            .animateToPage(
              number != 0 ? number - 1 : number,
              duration: const Duration(milliseconds: 200),
              curve: Curves.linear,
            )
            .then((value) => Navigator.pop(context));
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: linearGradientLight,
          borderRadius: BorderRadius.circular(25),
        ),
        child: ListTile(
          title: Text("Soal $number", textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
