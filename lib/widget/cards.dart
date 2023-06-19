import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  final String title;
  final Function()? onTap;
  const Cards({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          height: 150,
          width: double.maxFinite,
          child: Card(
            color: Colors.black12,
            child: Center(
              child: Text(
                title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
