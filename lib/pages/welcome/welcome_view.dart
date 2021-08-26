import 'package:flutter/material.dart';
import 'package:flutter_module/pages/welcome/welcome_controller.dart';
import 'package:get/get.dart';

class WelcomeView extends GetView<WelcomeController> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('欢迎'),
    );
  }

}