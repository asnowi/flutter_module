import 'package:flutter_module/pages/any/any_controller.dart';
import 'package:get/get.dart';

class AnyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnyController>(() => AnyController());
  }

}