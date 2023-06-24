import 'package:basics_of_animations/UI/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 850),
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          theme: ThemeData.dark(),
          home: const HomePage(title: 'Flutter Animations'),
        );
      },
    );
  }
}
