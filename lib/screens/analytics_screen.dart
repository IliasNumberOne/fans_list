import 'dart:io';

import 'package:fans_list/providers/providers.dart';
import 'package:fans_list/utils/utils.dart';
import 'package:fans_list/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final overlay = MediaQuery.of(context).padding;
    return Consumer<ContactProvider>(builder: (
      BuildContext context,
      ContactProvider contactProvider,
      Widget? child,
    ) {
      return Column(
        children: [
          Container(
            width: 390.w,
            height: 42.h + overlay.top.h,
            padding: EdgeInsets.only(
              top: overlay.top.h,
              right: 16.w,
              left: 16.w,
            ),
            color: Colors.white,
            child: Row(
              children: [
                Spacer(),
                Text(
                  'Analytics',
                  textAlign: TextAlign.center,
                  style: ThemeStyles.black17,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Image.asset(
                      'assets/images/icons/filter.png',
                      width: 24.w,
                      height: 24.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 14.h),
          Container(
            width: 358.w,
            height: 150.h,
            padding: EdgeInsets.all(16.sp),
            decoration: ThemeStyles.decoration1,
            child: Column(
              children: [
                Text(
                  'Top Interacted',
                  style: ThemeStyles.black17,
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    contactProvider.contactList.take(4).length,
                    (i) => Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(200.r),
                          child: Image.file(
                            File(contactProvider.contactList[i].image),
                            width: 56.w,
                            height: 56.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          contactProvider.contactList[i].name.split(' ')[0],
                          style: ThemeStyles.black12,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Most Frequent',
                  style: ThemeStyles.black17,
                ),
                Row(
                  children: [
                    Text(
                      'Month  ',
                      style: ThemeStyles.blue15,
                    ),
                    Image.asset(
                      'assets/images/icons/arrow_down.png',
                      width: 24.w,
                      height: 24.h,
                      fit: BoxFit.cover,
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          Expanded(
            child: ListView.builder(
              itemCount: contactProvider.contactList.take(5).length,
              padding: EdgeInsets.all(16.sp),
              itemBuilder: (context, i) {
                return Contact(
                  image: contactProvider.contactList[i].image,
                  name: contactProvider.contactList[i].name,
                  category: contactProvider.contactList[i].category,
                );
              },
            ),
          ),
        ],
      );
    });
  }
}
