import 'package:fans_list/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class NoContacts extends StatelessWidget {
  const NoContacts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "There's nothing here yet",
          style: ThemeStyles.black17,
        ),
        SizedBox(height: 32.h),
        GestureDetector(
          onTap: () => context.go('/add_new'),
          child: Text(
            'Add contact',
            style: ThemeStyles.blue15W6,
          ),
        ),
      ],
    );
  }
}
