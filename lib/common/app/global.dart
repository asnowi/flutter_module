import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_module/common/app/index.dart';
import 'package:flutter_module/common/utils/index.dart';
import 'package:lottie/lottie.dart';

/// 全局配置
class Global {
  /// 是否 release
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  /// 是否 ios
  static bool isIOS = Platform.isIOS;
  /// 是否 android
  static bool isAndroid = Platform.isAndroid;

  /// init
  static Future init() async{
    // 运行初始
    WidgetsFlutterBinding.ensureInitialized();
    // 工具初始
    await StorageUtil().init();
    //  android 状态栏为透明的沉浸
    if (isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle =
      SystemUiOverlayStyle(
          statusBarColor: Colors.redAccent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarDividerColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark
      );
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
      Logger.ggq('global init---');
    }

    EasyLoading.instance
      ..loadingStyle = EasyLoadingStyle.custom
      ..maskColor = Colors.black
      ..backgroundColor = Colors.black
      ..indicatorColor = Colors.white
      ..animationStyle = EasyLoadingAnimationStyle.opacity
      ..textColor = Colors.white
      ..indicatorType = EasyLoadingIndicatorType.circle
      ..indicatorSize = 32
      ..radius = 8
      ..fontSize = 12
      ..contentPadding = const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16
      )
      ..indicatorWidget = Container(
        color: Colors.black,
        width: 42,
        height: 42,
        child: Lottie.asset(AssetsProvider.lottiePath('loading')),
      )
      /// 是否點擊外部消失
    // ..dismissOnTap = false;
      ..dismissOnTap = true;
  }
}
