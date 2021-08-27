import 'package:flutter_module/pages/star/star_controller.dart';
import 'package:get/get.dart';

class StarBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<StarController>(() => StarController());
  }

}