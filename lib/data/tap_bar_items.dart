import 'package:fans_list/models/models.dart';

final List<TapBar> tapBarItems = [
  const TapBar(
    id: 0,
    text: 'Home',
    regularImg: 'assets/images/tap_bar/home.png',
    selectedImg: 'assets/images/tap_bar/home_selected.png',
    path: '/',
  ),
  const TapBar(
    id: 1,
    text: 'Add new',
    regularImg: 'assets/images/tap_bar/add_new.png',
    selectedImg: 'assets/images/tap_bar/add_new_selected.png',
    path: '/add_new',
  ),
  const TapBar(
    id: 2,
    text: 'Gallery',
    regularImg: 'assets/images/tap_bar/gallery.png',
    selectedImg: 'assets/images/tap_bar/gallery_selected.png',
    path: '/gallery',
  ),
  const TapBar(
    id: 3,
    text: 'Analytics',
    regularImg: 'assets/images/tap_bar/analytics.png',
    selectedImg: 'assets/images/tap_bar/analytics_selected.png',
    path: '/analytics',
  ),
  const TapBar(
    id: 4,
    text: 'Settings',
    regularImg: 'assets/images/tap_bar/settings.png',
    selectedImg: 'assets/images/tap_bar/settings_selected.png',
    path: '/settings',
  ),
];
