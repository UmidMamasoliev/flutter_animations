import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 5.w),
      child: Center(
        child: GestureDetector(
          onTap: onTap,
          child: SizedBox(
            width: double.maxFinite,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r)),
              color: Colors.black12,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(20.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.start,
                      ),
                      demo,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
