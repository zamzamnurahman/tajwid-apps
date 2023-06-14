import 'package:flutter/material.dart';

import '../../config/theme.dart';

class ButtonCircle extends StatelessWidget {
  final Widget child;
  final bool isGradient;
  const ButtonCircle({
    super.key,
    required this.child,
    required this.isGradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: isGradient ? null : primaryColor,
          border: Border.all(color: primaryColor),
          borderRadius: BorderRadius.circular(100),
          gradient: isGradient ? linearGradient : null,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(-2, 4),
              blurRadius: 5,
              spreadRadius: 2,
            )
          ]),
      child: child,
    );
  }
}
