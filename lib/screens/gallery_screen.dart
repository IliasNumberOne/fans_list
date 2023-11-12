import 'package:fans_list/utils/utils.dart';
import 'package:fans_list/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  final controller = TextEditingController();
  final focusNode = FocusNode();
  int selected = 0;

  void _onTap(int index) {
    setState(() {
      selected = index;
    });
  }

  final List<String> categories = [
    'All',
    'Tinder',
    'Instagram',
    'Badoo',
    'Featured',
    'dfdfd',
    'Feared',
  ];

  @override
  Widget build(BuildContext context) {
    final overlay = MediaQuery.of(context).padding.top;
    return Column(
      children: [
        Container(
          width: 390.w,
          height: 42.h + overlay.h,
          padding: EdgeInsets.only(
            top: overlay.h,
            right: 16.w,
            left: 16.w,
          ),
          color: Colors.white,
          child: Row(
            children: [
              Spacer(),
              Text(
                'Gallery',
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
        SizedBox(height: 15.h),
        CustomSearchBar(
          focusNode: focusNode,
        ),
        SizedBox(height: 16.h),
        Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: Container(
            height: 31.h,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: ThemeColors.lightBlue, width: 1),
              ),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: List.generate(
                  categories.length,
                  (index) => GestureDetector(
                    onTap: () => _onTap(index),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.h),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: ThemeColors.blue,
                            width: selected == index ? 3 : 0,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          categories[index],
                          style: ThemeStyles.blue12
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            itemCount: 10,
            padding: EdgeInsets.all(16.sp),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 190.h,
              mainAxisSpacing: 16.h,
              crossAxisSpacing: 16.w,
            ),
            itemBuilder: (context, index) {
              return GalleryItem();
            },
          ),
        ),
      ],
    );
  }
}
