import 'package:flutter/material.dart';

class ButtonClickUp extends StatefulWidget {
  final Widget child;
  final void Function() click;
  const ButtonClickUp({
    super.key,
    required this.child,
    required this.click,
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
        padding: const EdgeInsets.all(10),
        child: InkWell(
          onTapDown: (tap) {
            _controller.forward();
            Future.delayed(const Duration(milliseconds: 150), () {
              _controller.reverse();
            });
          },
          onTap: widget.click,
          child: ScaleTransition(
            scale: Tween<double>(
              begin: 1.0,
              end: 0.8,
            ).animate(_controller),
            child: widget.child,
          ),
        ));
  }
}
