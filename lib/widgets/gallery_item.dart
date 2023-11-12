import 'package:fans_list/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class GalleryItem extends StatelessWidget {
  const GalleryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go('/gallery/contact_photos'),
      child: Container(
        padding: EdgeInsets.all(8.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          image: DecorationImage(
            image: AssetImage(
              'assets/images/Photos.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
            Text(
              'Marion Sanford, 33',
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
