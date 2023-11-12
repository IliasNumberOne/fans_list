import 'package:fans_list/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ContactPhotosScreen extends StatelessWidget {
  const ContactPhotosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final overlay = MediaQuery.of(context).padding;
    return Column(
      children: [
        Container(
          width: 390.w,
          padding: EdgeInsets.only(
            top: (8 + overlay.top).h,
            right: 16.w,
            bottom: 8.h,
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
              SizedBox(
                width: 115.w,
                child: Text(
                  'Marion Sanford',
                  textAlign: TextAlign.center,
                  style: ThemeStyles.black17,
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.topRight,
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
          child: Stack(
            alignment: Alignment.center,
            children: [
              5 > 0
                  ? GridView.builder(
                      itemCount: 12,
                      padding: EdgeInsets.only(
                        top: 16.h,
                        right: 16.w,
                        bottom: 50.h,
                        left: 16.w,
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 170.h,
                        mainAxisSpacing: 16.h,
                        crossAxisSpacing: 16.w,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.only(top: 8.h, bottom: 8.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/Photos.png',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Image.asset(
                              'assets/images/icons/more.png',
                              width: 24.w,
                              height: 24.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    )
                  : SizedBox(
                      width: 358.w,
                      child: Text(
                        'No photos yet',
                        textAlign: TextAlign.center,
                        style: ThemeStyles.grey15,
                      ),
                    ),
              Positioned(
                bottom: overlay.bottom.h,
                child: GestureDetector(
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
                        'Add more',
                        style: ThemeStyles.white17,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
