import 'package:fans_list/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PremiumScreen extends StatelessWidget {
  const PremiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final overlay = MediaQuery.of(context).padding;
    return Material(
      color: ThemeColors.bg,
      child: Column(
        children: [
          Container(
            width: 390.w,
            height: 42.h + overlay.top.h,
            padding: EdgeInsets.only(
              top: overlay.top.h,
              right: 16.w,
            ),
            color: Colors.white,
            child: Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: context.pop,
                child: Image.asset(
                  'assets/images/icons/close.png',
                  width: 16.w,
                  height: 16.h,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 40.h,
              bottom: 64.h,
            ),
            child: Image.asset(
              'assets/images/logo.png',
              width: 184.w,
              height: 200.h,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            width: 358.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'FULL ACCES NOW:',
                  style: ThemeStyles.black22,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10.w,
                    right: 10.w,
                    top: 24.h,
                    bottom: 16.h,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('1. ', style: ThemeStyles.black17),
                      Expanded(
                        child: Text(
                          'unlimited number of contacts and photos',
                          style: ThemeStyles.black17,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10.w,
                    right: 10.w,
                    bottom: 16.h,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('2. ', style: ThemeStyles.black17),
                      Expanded(
                        child: Text(
                          'unlimited number of contact and additions',
                          style: ThemeStyles.black17,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10.w,
                    right: 10.w,
                    bottom: 65.h,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('3. ', style: ThemeStyles.black17),
                      Expanded(
                        child: Text(
                          'without ADS',
                          style: ThemeStyles.black17,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
                width: 358.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: ThemeColors.blue,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Center(
                    child: Text(
                  'BUY PREMIUM FOR \$1,99',
                  style: ThemeStyles.white17,
                ))),
          ),
          Padding(
            padding: EdgeInsets.only(top: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Privacy poicy',
                  style: ThemeStyles.blue12,
                ),
                SizedBox(width: 40.w),
                Text(
                  'Terms of use',
                  style: ThemeStyles.blue12,
                ),
                SizedBox(width: 40.w),
                Text(
                  'Restore',
                  style: ThemeStyles.blue12,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
