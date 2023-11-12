import 'package:fans_list/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryLabel extends StatelessWidget {
  const CategoryLabel({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
        vertical: 4.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(color: ThemeColors.blue),
      ),
      child: Text(
        text,
        style: ThemeStyles.blue12,
      ),
    );
  }
}
