import 'dart:io';

import 'package:fans_list/providers/providers.dart';
import 'package:fans_list/utils/utils.dart';
import 'package:fans_list/widgets/category_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ContactInfoScreen extends StatelessWidget {
  const ContactInfoScreen({super.key});

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
                Expanded(
                  child: GestureDetector(
                    onTap: context.pop,
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/icons/arrow_left.png',
                          width: 24.w,
                          height: 24.h,
                          fit: BoxFit.cover,
                        ),
                        Text(
                          '  Back',
                          style: ThemeStyles.blue15,
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  'Contact',
                  textAlign: TextAlign.center,
                  style: ThemeStyles.black17,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Image.asset(
                      'assets/images/icons/edit.png',
                      width: 24.w,
                      height: 24.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: 12.h),
              child: Column(
                children: [
                  Container(
                    width: 358.w,
                    height: 421.h,
                    padding: EdgeInsets.all(16.sp),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      image: DecorationImage(
                        image: FileImage(
                          File(contactProvider.contactInfo.image,)
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spacer(),
                        Text(
                          "${contactProvider.contactInfo.name}, ${contactProvider.contactInfo.age}",
                          style: ThemeStyles.white22,
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          children: [
                            Row(
                              children: List.generate(
                                1,
                                (i) => Padding(
                                  padding: EdgeInsets.only(right: 8.w),
                                  child: CategoryLabel(
                                    text: contactProvider.contactInfo.category,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 25.w,
                                height: 23.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(200.r),
                                ),
                                child: Center(
                                  child: Text(
                                    '+',
                                    textAlign: TextAlign.center,
                                    style: ThemeStyles.blue12,
                                  ),
                                ),
                              ),
                            ),
                            Spacer(),
                            Row(
                              children: List.generate(
                                5,
                                (i) => Padding(
                                  padding: EdgeInsets.only(left: 6.w),
                                  child: Container(
                                    width: 3.w,
                                    height: 16.h,
                                    decoration: BoxDecoration(
                                      color: i == 3
                                          ? ThemeColors.blue
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Container(
                    width: 358.w,
                    height: 100.h,
                    padding: EdgeInsets.all(8.sp),
                    decoration: ThemeStyles.decoration1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          SizedBox(
                            width: 72.w,
                            child: Text(
                              'Birthday',
                              style: ThemeStyles.black15W6,
                            ),
                          ),
                          SizedBox(width: 11.w),
                          Text(
                            contactProvider.contactInfo.birthday,
                            style: ThemeStyles.grey15,
                          ),
                        ]),
                        Row(children: [
                          SizedBox(
                            width: 72.w,
                            child: Text(
                              'Age',
                              style: ThemeStyles.black15W6,
                            ),
                          ),
                          SizedBox(width: 11.w),
                          Text(
                            contactProvider.contactInfo.age.toString(),
                            style: ThemeStyles.grey15,
                          ),
                        ]),
                        Row(children: [
                          SizedBox(
                            width: 72.w,
                            child: Text(
                              'Phone',
                              style: ThemeStyles.black15W6,
                            ),
                          ),
                          SizedBox(width: 11.w),
                          Text(
                            contactProvider.contactInfo.phoneNumber,
                            style: ThemeStyles.grey15,
                          ),
                        ]),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    width: 358.w,
                    padding: EdgeInsets.all(8.sp),
                    decoration: ThemeStyles.decoration1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Personal Notes:',
                          style: ThemeStyles.black15W6,
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          contactProvider.contactInfo.bio,
                          style: ThemeStyles.grey15,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 390.w,
            height: (80 + overlay.bottom).h,
            padding: EdgeInsets.only(
              top: 20.h,
              right: 16.w,
              bottom: (8 + overlay.bottom).h,
              left: 16.w,
            ),
            color: ThemeColors.bg,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 170.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(
                        color: ThemeColors.blue,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Call',
                          style: ThemeStyles.blue17,
                        ),
                        SizedBox(width: 8.w),
                        Image.asset(
                          'assets/images/icons/call.png',
                          width: 24.w,
                          height: 24.h,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 170.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: ThemeColors.blue,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Message',
                          style: ThemeStyles.white17,
                        ),
                        SizedBox(width: 8.w),
                        Image.asset(
                          'assets/images/icons/message.png',
                          width: 24.w,
                          height: 24.h,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
