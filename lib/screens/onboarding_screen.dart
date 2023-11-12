import 'package:fans_list/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<String> titles = [
    'Manage Your Personal Connections',
    'Prioritize with Ease',
    'Your Secrets are Safe',
  ];
  final List<String> bodies = [
    'HushList offers a discreet and secure space to keep track of all your intimate relationships. Organize, categorize, and remember personal details effortlessly.',
    "Create custom folders, add tags, and set preferences to manage interactions. Always keep your priorities aligned with your personal life's dynamics.",
    'Your privacy is our priority. With end-to-end encryption and advanced security features, your data stays only yours. Relax, knowing your information is protected.',
  ];
  final _controller = PageController();

  int _currentIndex = 0;

  createCircle(int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      margin: EdgeInsets.only(right: 4),
      height: 6,
      width: _currentIndex == index ? 48 : 6,
      // current indicator is wider
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final overlay = MediaQuery.of(context).padding;
    return Material(

      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
            width: 390.w,
            height: 844.h,
            child: PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              children: List.generate(
                titles.length,
                (index) {
                  final title = titles[index];
                  final body = bodies[index];
                  return _buildBody(title, body, index);
                },
              ),
            ),
          ),
          Container(
            width: 390.w,
            height: 42.h + overlay.top.h,
            padding: EdgeInsets.only(
              top: overlay.top.h,
              right: 16.w,
              left: 16.w,
            ),
            child: Row(
              children: [
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (index) => createCircle(index),
                  ),
                ),
                Expanded(
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _controller.animateToPage(
                              titles.length - 1,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          });
                        },
                        child: Text(
                          'Skip',
                          style: ThemeStyles.white15,
                        ),
                      )),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: (16 + overlay.bottom).h,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  if (_currentIndex == titles.length - 1) {
                    context.go('/');
                    return;
                  }
                  _controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                });
              },
              child: Container(
                width: 358.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Center(
                  child: Text(
                    _currentIndex == titles.length - 1 ? 'Continue' : 'Next',
                    style: ThemeStyles.white17,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(String title, String body, int index) {
    return Container(
      width: 390.w,
      height: 844.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/onboardings/${index + 1}.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 480.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              title,
              style: ThemeStyles.white32,
            ),
          ),
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              body,
              style: ThemeStyles.white15,
            ),
          ),
        ],
      ),
    );
  }
}
