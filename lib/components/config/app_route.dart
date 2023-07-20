// ignore_for_file: unused_import

import 'package:get/get_navigation/src/routes/get_route.dart';
import '../../features/detaile/binding/detaile_binding.dart';
import '../../features/detaile/presentation/detaile_screen.dart';
import '../../features/home/binding/home_binding.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/splash/presentation/splash_screen.dart';
import '../../main.dart';


class AppRoute {
  static const String defaultRoute = '/';
  static const String notFound = '/notFound';
  static const String registerScreen = '/registerScreen';
  static const String loginScreen = '/loginScreen';
  static const String dummy = '/home';
  static const String detail = '/detaile';
  static List<GetPage> pages = [
    GetPage(name: defaultRoute, page: () => const SplashScreen()),
    GetPage(name: dummy, page: () => const DummyScreen(), binding: DummyBinding()),
    GetPage(name: detail, page: () => const Detail(), binding: DetaileBidning())

  ];
}