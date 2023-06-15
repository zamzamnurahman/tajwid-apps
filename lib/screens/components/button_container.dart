import 'package:flutter/material.dart';

import '../../config/theme.dart';

class ButtonContainer extends StatelessWidget {
  final String title;
  const ButtonContainer({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          gradient: linearGradient,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              offset: const Offset(-4, 4),
              blurRadius: 5,
            )
          ],
          borderRadius: BorderRadius.circular(15)),
      child: Text(title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          )),
    );
  }
}
