import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedGradientBorder extends StatefulWidget {
  const AnimatedGradientBorder({super.key});

  @override
  State<AnimatedGradientBorder> createState() => _AnimatedGradientBorderState();
}

class _AnimatedGradientBorderState extends State<AnimatedGradientBorder>
    with SingleTickerProviderStateMixin {
  List<Color> colors = [
    Colors.orange,
    Colors.deepOrange,
    Colors.deepOrange,
    Colors.deepOrange,
    Colors.deepOrange,
    Colors.orange,
    Colors.orange,
    Colors.purpleAccent,
    Colors.purple,
    Colors.purple,
    Colors.deepPurple,
    Colors.deepPurple,
    Colors.deepPurple,
    Colors.purple,
    Colors.purple,
    Colors.purpleAccent,
    Colors.lightGreen,
    Colors.lightGreen,
    Colors.green,
    Colors.green,
    Colors.green,
    Colors.lightGreen,
    Colors.lightGreen,
    Colors.orange,
  ];
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat();

    _animation = Tween<double>(begin: 0.0, end: 2 * pi).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Container(
            constraints: const BoxConstraints.tightFor(width: 150, height: 200),
            decoration: BoxDecoration(
              gradient: SweepGradient(
                colors: colors,
                transform: GradientRotation(_animation.value),
              ),
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(color: Colors.transparent, width: 2.0),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF1C1B1F),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: const Center(
                child: Text(
                  "Hello, World!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
