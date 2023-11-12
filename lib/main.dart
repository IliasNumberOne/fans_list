import 'package:fans_list/data/data.dart';
import 'package:fans_list/providers/contact_provider.dart';
import 'package:fans_list/providers/providers.dart';
import 'package:fans_list/screens/screens.dart';
import 'package:fans_list/services/services.dart';
import 'package:fans_list/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
  ));
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  final sqlService = SqlService();
  await sqlService.init();
  runApp(
    ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) {
        return FansListApp(
          sqlService: sqlService,
        );
      },
    ),
  );
}

class FansListApp extends StatefulWidget {
  const FansListApp({
    Key? key,
    required this.sqlService,
  }) : super(key: key);

  final SqlService sqlService;

  @override
  State<FansListApp> createState() => _FansListAppState();
}

class _FansListAppState extends State<FansListApp> {
  late GoRouter _router;

  @override
  void initState() {
    super.initState();
    _router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/splash_screen',
          pageBuilder: (context, state) {
            return buildPageWithDefaultTransition(
              context: context,
              state: state,
              child: SplashScreen(),
            );
          },
        ),
        GoRoute(
          path: '/onboarding_screen',
          pageBuilder: (context, state) {
            return buildPageWithDefaultTransition(
              context: context,
              state: state,
              child: OnboardingScreen(),
            );
          },
        ),
        GoRoute(
          path: '/premium_screen',
          pageBuilder: (context, state) {
            return buildPageWithDefaultTransition(
              context: context,
              state: state,
              child: PremiumScreen(),
            );
          },
        ),
        ShellRoute(
          pageBuilder: (context, state, child) {
            final hasBottomBar = (state.fullPath != '/contact_info' &&
                state.fullPath != '/gallery/contact_photos' &&
                state.fullPath != '/add_new/new_contact');
            return buildPageWithDefaultTransition(
              context: context,
              state: state,
              child: BottomNavigation(
                currentPath: state.fullPath ?? '/',
                hasBottomBar: hasBottomBar,
                child: child,
              ),
            );
          },
          routes: [
            GoRoute(
                path: tapBarItems[0].path,
                pageBuilder: (context, state) {
                  return buildPageWithDefaultTransition(
                    context: context,
                    state: state,
                    child: HomeScreen(),
                  );
                },
                routes: [
                  GoRoute(
                    path: 'contact_info',
                    pageBuilder: (context, state) {
                      return buildPageWithDefaultTransition(
                        context: context,
                        state: state,
                        child: ContactInfoScreen(),
                      );
                    },
                  ),
                ]),
            GoRoute(
                path: tapBarItems[1].path,
                pageBuilder: (context, state) {
                  return buildPageWithDefaultTransition(
                    context: context,
                    state: state,
                    child: AddNewScreen(),
                  );
                },
                routes: [
                  GoRoute(
                    path: 'new_contact',
                    pageBuilder: (context, state) {
                      return buildPageWithDefaultTransition(
                        context: context,
                        state: state,
                        child: NewContactScreen(),
                      );
                    },
                  ),
                ]),
            GoRoute(
                path: tapBarItems[2].path,
                pageBuilder: (context, state) {
                  return buildPageWithDefaultTransition(
                    context: context,
                    state: state,
                    child: GalleryScreen(),
                  );
                },
                routes: [
                  GoRoute(
                    path: 'contact_photos',
                    pageBuilder: (context, state) {
                      return buildPageWithDefaultTransition(
                        context: context,
                        state: state,
                        child: ContactPhotosScreen(),
                      );
                    },
                  ),
                ]),
            GoRoute(
              path: tapBarItems[3].path,
              pageBuilder: (context, state) {
                return buildPageWithDefaultTransition(
                  context: context,
                  state: state,
                  child: AnalyticsScreen(),
                );
              },
            ),
            GoRoute(
              path: tapBarItems[4].path,
              pageBuilder: (context, state) {
                return buildPageWithDefaultTransition(
                  context: context,
                  state: state,
                  child: SettingsScreen(),
                );
              },
            )
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final overlay = MediaQuery.of(context).padding;
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => ContactService(widget.sqlService.database),
        ),
        ChangeNotifierProvider(
          create: (context) => ContactProvider(
            contactService: context.read<ContactService>(),
          )..initState(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeProvider(
            contactService: context.read<ContactService>(),
          )..initState(),
        ),
      ],
      builder: (BuildContext context, Widget? child) {
        return MaterialApp.router(
          theme: ThemeData(fontFamily: 'Poppins'),
          debugShowCheckedModeBanner: false,
          routerConfig: _router,
        );
      },
    );
  }
}

CustomTransitionPage buildPageWithDefaultTransition({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
  bool opaque = true,
}) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: Duration.zero,
    opaque: opaque,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}
