import 'package:fans_list/data/data.dart';
import 'package:fans_list/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({
    super.key,
    required this.child,
    this.hasBottomBar = true,
    required this.currentPath,
  });

  final Widget child;
  final bool hasBottomBar;
  final String currentPath;

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  void _onTap(String path) {
    setState(() {
      context.go(path);
    });
  }

  @override
  Widget build(BuildContext context) {
    final overlay = MediaQuery.of(context).padding.bottom;
    return Material(
      color: ThemeColors.bg,
      child: Column(
        children: [
          Expanded(
            child: widget.child,
          ),
          Visibility(
            visible: widget.hasBottomBar,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 900),
              curve: Curves.easeInOut,
              width: 390.w,
              height: (57+overlay).h,
              padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: overlay.h,),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: List.generate(
                  tapBarItems.length,
                  (i) => GestureDetector(
                    onTap: () => _onTap(tapBarItems[i].path),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                          widget.currentPath == tapBarItems[i].path
                              ? tapBarItems[i].selectedImg
                              : tapBarItems[i].regularImg,
                          width: 24.w,
                          height: 24.h,
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          tapBarItems[i].text,
                          style: widget.currentPath == tapBarItems[i].path
                              ? ThemeStyles.blue12
                              : ThemeStyles.grey12,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
