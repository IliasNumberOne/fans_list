import 'package:fans_list/data/data.dart';
import 'package:fans_list/providers/contact_provider.dart';
import 'package:fans_list/utils/utils.dart';
import 'package:fans_list/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AddNewScreen extends StatelessWidget {
  const AddNewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final overlay = MediaQuery.of(context).padding.top;
    return Consumer<ContactProvider>(builder:
        (BuildContext context, ContactProvider contactProvider, Widget? child) {
      return Column(
        children: [
          Container(
            width: 390.w,
            height: 42.h + overlay.h,
            padding: EdgeInsets.only(top: overlay.h),
            color: Colors.white,
            child: Center(
              child: Text(
                'Add contacts',
                textAlign: TextAlign.center,
                style: ThemeStyles.black17,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              padding: EdgeInsets.all(16.sp),
              itemBuilder: (context, i) {
                return CategoryItem(
                  onTap: () => {
                    contactProvider.contactCategory = categories[i].name,
                    context.go('/add_new/new_contact'),
                  },
                  name: categories[i].name,
                  subText: categories[i].subText,
                  icon: categories[i].icon,
                );
              },
            ),
          ),
        ],
      );
    });
  }
}
