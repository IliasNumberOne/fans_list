import 'dart:io';

import 'package:fans_list/utils/utils.dart';
import 'package:fans_list/widgets/category_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Contact extends StatelessWidget {
  const Contact({
    super.key,
    this.onTap,
    required this.image,
    required this.name,
    required this.category,
  });

  final VoidCallback? onTap;
  final String image;
  final String name;
  final String category;

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      'All',
      'Tinder',
      'Instagram',
      'Badoo',
      'Featured',
      'dfdfd',
      'Feared',
    ];
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 358.w,
          height: 70.h,
          padding: EdgeInsets.all(8.sp),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Image.file(
                  File(image),
                  width: 48.w,
                  height: 48.h,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 16.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: ThemeStyles.black17,
                  ),
                  Row(
                    children: List.generate(
                      1,
                      (index) => Padding(
                        padding: EdgeInsets.only(right: 4.w),
                        child: CategoryLabel(
                          text: category,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
