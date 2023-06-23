import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class ThreeDAnimations extends StatefulWidget {
  final double height;
  final double width;
  const ThreeDAnimations({
    super.key,
    this.height = 150,
    this.width = 150,
  });

  @override
  State<ThreeDAnimations> createState() => _ThreeDAnimationsState();
}

class _ThreeDAnimationsState extends State<ThreeDAnimations>
    with TickerProviderStateMixin {
  late AnimationController _xController;
  late AnimationController _yController;
  late AnimationController _zController;
  late Tween<double> _animation;

  final Color _primaryColor = Colors.white.withOpacity(0.2);

  @override
  void initState() {
    super.initState();

    _xController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )
      ..reset()
      ..repeat();

    _yController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    )
      ..reset()
      ..repeat();

    _zController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 40),
    )
      ..reset()
      ..repeat();

    _animation = Tween<double>(
      begin: 0,
      end: pi * 2,
    );
  }

  @override
  void dispose() {
    _xController.dispose();
    _yController.dispose();
    _zController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height + 80,
      width: widget.width + 80,
      child: Center(
        child: AnimatedBuilder(
          animation: Listenable.merge(
            [
              _xController,
              _yController,
              _zController,
            ],
          ),
          builder: (context, child) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..rotateX(_animation.evaluate(_xController))
                ..rotateY(_animation.evaluate(_yController))
                ..rotateZ(_animation.evaluate(_zController)),
              child: Stack(
                children: [
                  //back side
                  boxSides(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..translate(Vector3(0, 0, -widget.height)),
                  ),
                  //left side
                  boxSides(
                    alignment: Alignment.centerLeft,
                    transform: Matrix4.identity()..rotateY(pi / 2),
                  ),
                  //right side
                  boxSides(
                    alignment: Alignment.centerRight,
                    transform: Matrix4.identity()..rotateY(-pi / 2),
                  ),
                  //front side
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      color: _primaryColor,
                    ),
                    height: widget.height,
                    width: widget.width,
                  ),
                  //top side
                  boxSides(
                    alignment: Alignment.topCenter,
                    transform: Matrix4.identity()..rotateX(-pi / 2),
                  ),
                  //bottom side
                  boxSides(
                    alignment: Alignment.bottomCenter,
                    transform: Matrix4.identity()..rotateX(pi / 2),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget boxSides({
    required AlignmentGeometry alignment,
    required Matrix4 transform,
  }) {
    return Transform(
      alignment: alignment,
      transform: transform,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          color: _primaryColor,
        ),
        height: widget.height,
        width: widget.width,
      ),
    );
  }
}
