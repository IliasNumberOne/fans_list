import 'package:fans_list/data/data.dart';
import 'package:fans_list/providers/providers.dart';
import 'package:fans_list/utils/utils.dart';
import 'package:fans_list/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final overlay = MediaQuery.of(context).padding.top;
    return Consumer<GalleryProvider>(builder: (
      BuildContext context,
      GalleryProvider galleryProvider,
      Widget? child,
    ) {
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
            onChanged: galleryProvider.onSearch,
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
                      onTap: () => galleryProvider.changeCategory(index),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.h),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: ThemeColors.blue,
                              width: galleryProvider.selected == index ? 3 : 0,
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
            child: galleryProvider.contactList.isNotEmpty
                ? GridView.builder(
                    itemCount: galleryProvider.contactList.length,
                    padding: EdgeInsets.all(16.sp),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 190.h,
                      mainAxisSpacing: 16.h,
                      crossAxisSpacing: 16.w,
                    ),
                    itemBuilder: (context, i) {
                      return GalleryItem(
                        onTap: () => {
                          galleryProvider.getPhotos(i),
                          context.go('/gallery/contact_photos'),
                        },
                        image: galleryProvider.contactList[i].image,
                        name: galleryProvider.contactList[i].name,
                        age: galleryProvider.contactList[i].age,
                      );
                    },
                  )
                : const NoContacts(),
          ),
        ],
      );
    });
  }
}
