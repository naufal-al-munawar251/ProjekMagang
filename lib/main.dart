import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'components/config/app_const.dart';
import 'components/config/app_route.dart';
import 'components/config/app_style.dart';
import 'components/services/app_service.dart';
import 'components/util/storage_util.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _dependencyInjection();
  await GetStorage.init();
  runApp(const MyApp());
}

Future _dependencyInjection() async {
  final storage = StorageUtil(SecureStorage());
  Get.lazyPut(() => storage, fenix: true);
  Get.put(AppService(storage));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConst.appName,
      initialRoute: AppRoute.defaultRoute,
      unknownRoute: GetPage(name: AppRoute.notFound, page: () => const UnknownRoutePage()),
      getPages: AppRoute.pages,
    );
  }
}

class UnknownRoutePage extends StatelessWidget {
  const UnknownRoutePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Text('No route defined for this page')),
    );
  }
}

