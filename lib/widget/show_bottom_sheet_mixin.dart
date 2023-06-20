import 'dart:ui';

import 'package:flutter/material.dart';

mixin BottomSheetMixin {
  void showBottomSheetMixin(BuildContext context, Widget child) {
    showModalBottomSheet<void>(
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
                child,
              ],
            ),
          ),
        );
      },
    );
  }
}
