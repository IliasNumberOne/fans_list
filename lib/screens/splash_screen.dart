import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
    required this.initScreen,
  });

  final bool initScreen;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    print('init: ${widget.initScreen}');
    final path = widget.initScreen ? '/' : '/onboarding_screen';
    Future.delayed(const Duration(milliseconds: 800), () {
      context.go(path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/splash.png',
      width: 390.w,
      height: 844.h,
      fit: BoxFit.cover,
    );
  }
}
