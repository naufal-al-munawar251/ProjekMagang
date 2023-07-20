import 'package:get/get.dart';

import '../presentation/detaile_controller.dart';

class DetaileBidning extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DetaileController());
  }

}