import 'package:flutter_module/pages/home/home_view.dart';
import 'package:flutter_module/pages/login/login_binding.dart';
import 'package:flutter_module/pages/login/login_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {

  static final List<GetPage> routes = [

    GetPage(
      name: AppRoutes.home,
      page: () => HomeView(),
    ),

    GetPage(
      name: AppRoutes.login,
      page: () => LoginView(),
      binding: LoginBinding(),
      transitionDuration: Duration(milliseconds: 300),
    )
  ];

  // 找不到去登录页
  static final unknownRoute = GetPage(
    name: AppRoutes.login,
    page: () => LoginView(),
    transitionDuration: Duration(milliseconds: 300),
  );
}