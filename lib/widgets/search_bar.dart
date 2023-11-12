import 'package:fans_list/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar(
      {super.key, required this.focusNode, this.onChanged});

  final FocusNode focusNode;
  final void Function(String query)? onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: focusNode.requestFocus,
      child: Container(
          width: 358.w,
          height: 40.h,
          decoration: ThemeStyles.decoration1,
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 8.w),
                child: Image.asset(
                  'assets/images/icons/search.png',
                  width: 24.w,
                  height: 24.h,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: TextField(
                  onChanged: onChanged,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Search',
                    hintStyle: ThemeStyles.grey12,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
