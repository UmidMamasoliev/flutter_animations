import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basics of Animation',
      theme: ThemeData.dark(),
      home: const HomePage(title: 'Home Page'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _showBottomSheet(context);
        },
        label: const Text("Press"),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1C1B1F),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: Color(0xFF1C1B1F),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedGradientBorder(
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
                          fontSize: 32,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class AnimatedGradientBorder extends StatefulWidget {
  final Widget child;

  const AnimatedGradientBorder({super.key, required this.child});

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
            child: widget.child,
          );
        });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
