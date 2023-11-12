import 'package:fans_list/screens/screens.dart';
import 'package:fans_list/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final overlay = MediaQuery.of(context).padding;
    return Column(
      children: [
        Container(
          width: 390.w,
          height: 42.h + overlay.top.h,
          padding: EdgeInsets.only(top: overlay.top.h),
          color: Colors.white,
          child: Center(
            child: Text(
              'Settings',
              textAlign: TextAlign.center,
              style: ThemeStyles.black17,
            ),
          ),
        ),
        SizedBox(height: 16.h),
        Padding(
          padding: EdgeInsets.only(bottom: 8.h),
          child: GestureDetector(
            onTap: () {},
            child: Container(
                width: 358.w,
                height: 56.h,
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                decoration: ThemeStyles.decoration1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Privacy policy',
                      style: ThemeStyles.black15,
                    ),
                    Image.asset(
                      'assets/images/icons/arrow_right.png',
                      width: 24.w,
                      height: 24.h,
                      fit: BoxFit.cover,
                    ),
                  ],
                )),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 8.h),
          child: GestureDetector(
            onTap: () {},
            child: Container(
                width: 358.w,
                height: 56.h,
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                decoration: ThemeStyles.decoration1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Terms of use', style: ThemeStyles.black15),
                    Image.asset(
                      'assets/images/icons/arrow_right.png',
                      width: 24.w,
                      height: 24.h,
                      fit: BoxFit.cover,
                    ),
                  ],
                )),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 8.h),
          child: GestureDetector(
            onTap: () {},
            child: Container(
                width: 358.w,
                height: 56.h,
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                decoration: ThemeStyles.decoration1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Support', style: ThemeStyles.black15),
                    Image.asset(
                      'assets/images/icons/arrow_right.png',
                      width: 24.w,
                      height: 24.h,
                      fit: BoxFit.cover,
                    ),
                  ],
                )),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 8.h),
          child: GestureDetector(
            onTap: () {},
            child: Container(
                width: 358.w,
                height: 56.h,
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Restore', style: ThemeStyles.black15),
                    Image.asset(
                      'assets/images/icons/arrow_right.png',
                      width: 24.w,
                      height: 24.h,
                      fit: BoxFit.cover,
                    ),
                  ],
                )),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 8.h),
          child: GestureDetector(
            onTap: () => _onTapPremium(context),
            child: Container(
                width: 358.w,
                height: 56.h,
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'BUY PREMIUM FOR \$0,99',
                      style: ThemeStyles.blue15,
                    ),
                    Image.asset(
                      'assets/images/icons/arrow_right.png',
                      width: 24.w,
                      height: 24.h,
                      fit: BoxFit.cover,
                    ),
                  ],
                )),
          ),
        ),
      ],
    );
  }

  void _onTapPremium(BuildContext context) {
    final route = MaterialPageRoute(
      builder: (context) => const PremiumScreen(),
    );

    Navigator.of(context, rootNavigator: true).push(route);
  }
}

