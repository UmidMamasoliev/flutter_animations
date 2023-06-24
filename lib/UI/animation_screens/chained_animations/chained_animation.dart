// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'draw_the_arcs.dart';

class ChainedAnimation extends StatefulWidget {
  final double height;
  final double width;
  const ChainedAnimation({
    super.key,
    this.height = 150,
    this.width = 150,
  });

  @override
  State<ChainedAnimation> createState() => _ChainedAnimationState();
}

class _ChainedAnimationState extends State<ChainedAnimation>
    with TickerProviderStateMixin {
  late AnimationController _counterClockwiseRotationController;
  late Animation<double> _counterClockwiseRotationAnimation;

  late AnimationController _flipController;
  late Animation<double> _flipAnimation;

  @override
  void initState() {
    super.initState();

    //rotation animation

    _counterClockwiseRotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )
      ..reset()
      ..forward();

    _counterClockwiseRotationAnimation = Tween<double>(
      begin: 0,
      end: -(pi / 2),
    ).animate(
      CurvedAnimation(
        parent: _counterClockwiseRotationController,
        curve: Curves.bounceOut,
      ),
    );

    //flip animation

    _flipController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _flipAnimation = Tween<double>(
      begin: 0,
      end: pi,
    ).animate(
      CurvedAnimation(
        parent: _flipController,
        curve: Curves.bounceOut,
      ),
    );

    // status listeners

    _counterClockwiseRotationController.addStatusListener(
      _counterClockwiseRotationControllerListener,
    );

    _flipController.addStatusListener(
      _flipControllerListener,
    );
  }

  @override
  void dispose() {
    _flipController.removeStatusListener(
      _flipControllerListener,
    );
    _counterClockwiseRotationController.removeStatusListener(
      _counterClockwiseRotationControllerListener,
    );
    _flipController.dispose();
    _counterClockwiseRotationController.dispose();
    super.dispose();
  }

  void _counterClockwiseRotationControllerListener(status) {
    if (status == AnimationStatus.completed) {
      _flipAnimation = Tween<double>(
        begin: _flipAnimation.value,
        end: _flipAnimation.value + pi,
      ).animate(
        CurvedAnimation(
          parent: _flipController,
          curve: Curves.bounceOut,
        ),
      );

      //reset the [_flipController] and start the animations

      _flipController
        ..reset()
        ..forward();
    }
  }

  void _flipControllerListener(status) {
    if (status == AnimationStatus.completed) {
      _counterClockwiseRotationAnimation = Tween<double>(
        begin: _counterClockwiseRotationAnimation.value,
        end: _counterClockwiseRotationAnimation.value + -(pi / 2),
      ).animate(
        CurvedAnimation(
          parent: _counterClockwiseRotationController,
          curve: Curves.bounceOut,
        ),
      );

      //reset the [_counterClockwiseRotationController] and start the animations

      _counterClockwiseRotationController
        ..reset()
        ..forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _counterClockwiseRotationController,
      builder: (context, child) {
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..rotateZ(_counterClockwiseRotationAnimation.value),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedBuilder(
                animation: _flipController,
                builder: (context, child) {
                  return Transform(
                    alignment: Alignment.centerRight,
                    transform: Matrix4.identity()
                      ..rotateY(_flipAnimation.value),
                    child: ClipPath(
                      clipper: const HalfCircleClipper(side: CircleSide.left),
                      child: Container(
                        height: widget.height.h,
                        width: widget.width.w,
                        color: const Color(0xff0057b7),
                      ),
                    ),
                  );
                },
              ),
              AnimatedBuilder(
                animation: _flipController,
                builder: (context, child) {
                  return Transform(
                    alignment: Alignment.centerLeft,
                    transform: Matrix4.identity()
                      ..rotateY(_flipAnimation.value),
                    child: ClipPath(
                      clipper: const HalfCircleClipper(side: CircleSide.right),
                      child: Container(
                        height: widget.height.h,
                        width: widget.width.w,
                        color: const Color(0xffffd700),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
