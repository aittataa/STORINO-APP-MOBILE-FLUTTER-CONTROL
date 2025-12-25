import "dart:developer";

import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../register/views/register_view.dart";

class SplashController extends GetxController {
  @override
  Future<void> onInit() async {
    /// TODO: onInit
    super.onInit();
    return log("onInit SplashController");
  }

  Future<Widget> screenFunction(BuildContext context) async {
    try {
      return const RegisterView();
    } on Exception {
      return const RegisterView();
    } catch (e) {
      return const RegisterView();
    }
  }
}
