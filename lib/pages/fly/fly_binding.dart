import 'package:flutter_module/pages/fly/fly_controller.dart';
import 'package:get/get.dart';

class FlyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FlyController>(() => FlyController());
  }

}