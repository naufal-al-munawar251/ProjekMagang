import 'package:get/get.dart';

import '../../../components/util/network.dart';
import '../presentation/home_controller.dart';
import '../repository/home_datasource.dart';
import '../repository/home_repository.dart';

class DummyBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DummyDataSource(Network.dioClient()));
    Get.lazyPut(() => DummyRepository(Get.find()));
    Get.lazyPut(() => DummyController(Get.find()));
  }

}