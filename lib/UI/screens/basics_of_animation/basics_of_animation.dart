/* In this series, we covered the basics of animation and */
/* the understanding of [AnimatedBuilder] and [Transform]. */

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BasicsOfAnimation extends StatefulWidget {
  final double height;
  final double width;
  const BasicsOfAnimation({super.key, this.height = 200, this.width = 200});

  @override
  State<BasicsOfAnimation> createState() => _BasicsOfAnimationState();
}

class _BasicsOfAnimationState extends State<BasicsOfAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    animation =
        Tween<double>(begin: 0.0, end: 2 * pi).animate(animationController);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()..rotateY(animation.value),
              child: Container(
                width: widget.height.h,
                height: widget.width.w,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
