import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedGradientBorder extends StatefulWidget {
  final double height;
  final double width;
  const AnimatedGradientBorder({
    super.key,
    this.height = 300,
    this.width = 200,
  });

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
            constraints: BoxConstraints.tightFor(
              width: widget.width.w,
              height: widget.height.h,
            ),
            decoration: BoxDecoration(
              gradient: SweepGradient(
                colors: colors,
                transform: GradientRotation(_animation.value),
              ),
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(color: Colors.transparent, width: 2.w),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF1C1B1F),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Center(
                child: Text(
                  "Hello, World!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
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
