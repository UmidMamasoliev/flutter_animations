import 'package:basics_of_animations/basics_of_animation/basics_of_animation.dart';
import 'package:basics_of_animations/chained_animations/chained_animation.dart';
import 'package:basics_of_animations/widget/show_bottom_sheet_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 5.h),
            Cards(
              title: "Animated\nGradient\nBorder",
              demo: const AnimatedGradientBorder(height: 100, width: 100),
              onTap: () {
                showBottomSheetMixin(
                  context,
                  const AnimatedGradientBorder(),
                );
              },
            ),
            Cards(
              title: "Basics Of\nAnimation",
              demo: const BasicsOfAnimation(height: 100, width: 100),
              onTap: () {
                showBottomSheetMixin(
                  context,
                  const BasicsOfAnimation(),
                );
              },
            ),
            Cards(
              title: "Chained\nAnimation",
              demo: const ChainedAnimation(height: 100, width: 100),
              onTap: () {
                showBottomSheetMixin(
                  context,
                  const ChainedAnimation(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
