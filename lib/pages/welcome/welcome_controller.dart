import 'package:flutter_module/common/app/index.dart';
import 'package:flutter_module/common/router/app_pages.dart';
import 'package:flutter_module/common/utils/index.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController {
  @override
  void onInit() {
    StorageUtil().setBool(SaveInfoKey.HAS_HOME, true);
    Global.hasStartup = true;
    super.onInit();
  }

  void launchHome(){
    Get.offAndToNamed(AppRoutes.home);
  }
}