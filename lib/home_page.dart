import 'package:basics_of_animations/basics_of_animation/basics_of_animation.dart';
import 'package:basics_of_animations/widget/show_bottom_sheet_mixin.dart';
import 'package:flutter/material.dart';

import 'animated_gradient_border/animated_gradient_border.dart';
import 'widget/cards.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with BottomSheetMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 5),
            Cards(
              title: "AnimatedGradientBorder",
              demo: const AnimatedGradientBorder(),
              onTap: () {
                showBottomSheetMixin(
                  context,
                  const AnimatedGradientBorder(),
                );
              },
            ),
            Cards(
              title: "BasicsOfAnimation",
              demo: const BasicsOfAnimation(),
              onTap: () {
                showBottomSheetMixin(
                  context,
                  const BasicsOfAnimation(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
