import 'dart:io';

import 'package:fans_list/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GalleryItem extends StatelessWidget {
  const GalleryItem({
    super.key,
    this.onTap,
    required this.image,
    required this.name,
    required this.age
  });

  final VoidCallback? onTap;
  final String image;
  final String name;
  final int age;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          image: DecorationImage(
            image: FileImage(
              File(image),
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
            Text(
              '$name, $age',
              style: ThemeStyles.white12,
            ),
            SizedBox(height: 3.h),
            Text(
              '32 photos',
              style: ThemeStyles.lightBlue12,
            ),
          ],
        ),
      ),
    );
  }
}
