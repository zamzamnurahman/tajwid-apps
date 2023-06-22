import 'package:flutter/material.dart';

import '../../config/theme.dart';

class CardDescription extends StatelessWidget {
  final String desctiption;
  const CardDescription({
    super.key,
    required this.desctiption,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(20.0),
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
      child: Center(
        child: Text(desctiption,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
            )),
      ),
    );
  }
}
