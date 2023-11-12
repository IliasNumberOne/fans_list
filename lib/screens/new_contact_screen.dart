import 'package:fans_list/providers/providers.dart';
import 'package:fans_list/utils/utils.dart';
import 'package:fans_list/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class NewContactScreen extends StatefulWidget {
  const NewContactScreen({super.key});

  @override
  State<NewContactScreen> createState() => _NewContactScreenState();
}

class _NewContactScreenState extends State<NewContactScreen> {
  String birthday = '';
  String imagePath = '';
  int age = 0;
  final phoneController = TextEditingController();
  final nameController = TextEditingController();
  final bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final overlay = MediaQuery.of(context).padding;
    final bottomView = MediaQuery.of(context).viewInsets.bottom;
    return Consumer<ContactProvider>(
      builder: (
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
                    'New contact',
                    textAlign: TextAlign.center,
                    style: ThemeStyles.black17,
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Image.asset(
                        'assets/images/icons/check_mark.png',
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
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 44.h),
                    child: AddProfileImage(
                      profileImage: imagePath,
                      onTap: getImage,
                    ),
                  ),
                  Container(
                    width: 358.w,
                    height: 54.h,
                    decoration: ThemeStyles.decoration1,
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextField(
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        style: ThemeStyles.black15,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Name',
                          hintStyle: ThemeStyles.grey15,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: GestureDetector(
                        onTap: _showDialog,
                        child: Container(
                          width: 358.w,
                          height: 54.h,
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          decoration: ThemeStyles.decoration1,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              birthday.isEmpty ? 'Date of birth' : birthday,
                              style: birthday.isEmpty
                                  ? ThemeStyles.grey15
                                  : ThemeStyles.black15,
                            ),
                          ),
                        ),
                      )),
                  Container(
                    width: 358.w,
                    height: 54.h,
                    decoration: ThemeStyles.decoration1,
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        style: ThemeStyles.black15,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Phone number',
                          hintStyle: ThemeStyles.grey15,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    width: 358.w,
                    height: 160.h,
                    decoration: ThemeStyles.decoration1,
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
                    child: TextField(
                      controller: bioController,
                      expands: true,
                      maxLines: null,
                      keyboardType: TextInputType.text,
                      style: ThemeStyles.black15,
                      decoration: InputDecoration.collapsed(
                        hintText: 'Bio',
                        hintStyle: ThemeStyles.grey15,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: (bottomView).h,
                  ),
                ]),
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
                        child: Center(
                            child: Text(
                          'Dismiss',
                          style: ThemeStyles.blue17,
                        ))),
                  ),
                  GestureDetector(
                    onTap: () {
                      contactProvider.createContact(
                        imagePath,
                        nameController.text,
                        birthday,
                        phoneController.text,
                        bioController.text,
                        age,
                      );
                      imagePath = '';
                      birthday = '';
                      nameController.clear();
                      phoneController.clear();
                      bioController.clear();
                      setState(() {});
                    },
                    child: Container(
                      width: 170.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: ThemeColors.blue,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Center(
                          child: Text(
                        'Save',
                        style: ThemeStyles.white17,
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Future getImage() async {
    final XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      imagePath = image!.path;
    });
  }

  void _showDialog() {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            // This is called when the user changes the dateTime.
            onDateTimeChanged: (DateTime newTime) {
              setState(() {
                String zodiacSign = getZodiacSign(newTime);
                String timeFormat = DateFormat.yMMMMd().format(newTime);
                birthday = '$timeFormat, ($zodiacSign)';
                age = calculateAge(newTime);
              });
            },
          ),
        ),
      ),
    );
  }
}
