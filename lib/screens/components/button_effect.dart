import 'package:flutter/material.dart';

class ButtonClickUp extends StatefulWidget {
  final dynamic clicked;
  final Widget child;
  const ButtonClickUp({
    super.key,
    required this.child,
    required this.clicked,
  });

  @override
  State<ButtonClickUp> createState() => _ButtonClickUpState();
}

class _ButtonClickUpState extends State<ButtonClickUp>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(20),
        child: GestureDetector(
          onTap: () {
            _controller.forward();
            Future.delayed(const Duration(milliseconds: 150), () {
              _controller.reverse();
              widget.clicked;
            });
            print('Shrink');
          },
          child: ScaleTransition(
            scale: Tween<double>(
              begin: 1.0,
              end: 0.8,
            ).animate(_controller),
            child: ElevatedButton(
              onPressed: null,
              style: ElevatedButton.styleFrom(
                disabledBackgroundColor: Colors.blue,
                disabledForegroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(16),
              ),
              child: widget.child,
            ),
          ),
        ));
  }
}
