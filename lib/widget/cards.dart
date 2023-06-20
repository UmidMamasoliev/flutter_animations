import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  final String title;
  final Widget demo;
  final Function()? onTap;
  const Cards({
    super.key,
    required this.title,
    required this.onTap,
    required this.demo,
  });

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
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.black12,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: demo,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
