import 'package:fans_list/data/data.dart';
import 'package:fans_list/providers/providers.dart';
import 'package:fans_list/services/services.dart';
import 'package:fans_list/utils/theme_helper.dart';
import 'package:fans_list/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = TextEditingController();
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final overlay = MediaQuery.of(context).padding;
    return Consumer2<HomeProvider, ContactProvider>(builder: (
      BuildContext context,
      HomeProvider homeProvider,
      ContactProvider contactProvider,
      Widget? child,
    ) {
      return Column(
        children: [
          Container(
            width: 390.w,
            height: 42.h + overlay.top.h,
            padding: EdgeInsets.only(top: overlay.top.h),
            color: Colors.white,
            child: Center(
              child: Text(
                'Add contacts',
                textAlign: TextAlign.center,
                style: ThemeStyles.black17,
              ),
            ),
          ),
          SizedBox(height: 15.h),
          CustomSearchBar(
            focusNode: focusNode,
            onChanged: homeProvider.onSearch,
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
                      onTap: () => homeProvider.changeCategory(index),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.h),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: ThemeColors.blue,
                              width: homeProvider.selected == index ? 3 : 0,
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            index == 0
                                ? categories[0].additionalName
                                : categories[index].name,
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
            child: homeProvider.contactList.isNotEmpty
                ? ListView.builder(
                    itemCount: homeProvider.contactList.length,
                    padding: EdgeInsets.all(16.sp),
                    itemBuilder: (context, i) {
                      return Contact(
                        onTap: () => {
                          contactProvider.getContactInfo(i),
                          context.go('/contact_info'),
                        },
                        image: homeProvider.contactList[i].image,
                        name: homeProvider.contactList[i].name,
                        category: homeProvider.contactList[i].category,
                      );
                    },
                  )
                : Column(
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
                  ),
          ),
        ],
      );
    });
  }
}
