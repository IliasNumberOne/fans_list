import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:fans_list/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddProfileImage extends StatelessWidget {
  const AddProfileImage({
    super.key,
    required this.profileImage,
    this.onTap,
  });

  final String profileImage;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 170.w,
        height: 170.h,
        decoration: ThemeStyles.decoration1,
        child: profileImage.isEmpty
            ? DottedBorder(
                color: ThemeColors.blue,
                strokeWidth: 2.w,
                dashPattern: [8, 8],
                radius: Radius.circular(8.r),
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/icons/plus.png',
                        width: 24.w,
                        height: 24,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        'Add new',
                        style: ThemeStyles.blue15W6,
                      ),
                    ],
                  ),
                ),
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Image.file(
                  File(profileImage),
                  fit: BoxFit.cover,
                ),
              ),
      ),
    );
  }
}
