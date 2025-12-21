import "dart:developer";

import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../initial/views/initial_view.dart";
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
      /// TODO : Debug Mode
      if (kDebugMode) {
        return const InitialView();
        return const RegisterView();
      }

      /// TODO : Main View
      return const InitialView();
    } on Exception {
      return const RegisterView();
    } catch (e) {
      return const RegisterView();
    }
  }
}
