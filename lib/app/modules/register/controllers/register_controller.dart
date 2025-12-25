import "dart:async";
import "dart:developer";

import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../initial/views/initial_view.dart";
import "../pages/success_view.dart";
import "../pages/verification_view.dart";

class RegisterController extends GetxController {
  final ScrollController scrollController_1 = ScrollController();
  final ScrollController scrollController_2 = ScrollController();
  final GlobalKey<FormState> formKey_1 = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey_2 = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController pinController = TextEditingController();

  ///
  final RxBool anAsyncCall = false.obs;

  ///

  @override
  Future<void> onInit() async {
    /// TODO : onInit
    super.onInit();

    //if (kDebugMode) {
    nameController.text = "AIT TATA ABDERRAHIM";
    emailController.text = "aittata.abderrahim@gmail.com";
    phoneController.text = "0673377573";
    passwordController.text = "azerty@123456";
    pinController.text = "123456";
    //}
    return log("onInit RegisterController");
  }

  /// TODO : anObscureText
  final RxBool obscureText = (kReleaseMode).obs;

  void anObscureText() {
    obscureText.value = !obscureText.value;
  }

  /// TODO : goToVerificationView
  Future<void> goToVerificationView() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (formKey_1.currentState!.validate()) {
      anAsyncCall.value = true;
      return Future<void>.delayed(2500.milliseconds, () {
        anAsyncCall.value = false;
        return Get.to(() {
          return const VerificationView();
        });
      });
    }
    return log("goToVerificationView Failed");
  }

  /// TODO : goToSuccessView
  Future<void> goToSuccessView() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (formKey_1.currentState!.validate()) {
      anAsyncCall.value = true;
      return Future<void>.delayed(2500.milliseconds, () async {
        anAsyncCall.value = false;
        await goToInitialView();
        return Get.to(() {
          return const SuccessView();
        });
      });
    }
    return log("goToSuccessView Failed");
  }

  /// TODO : goToInitialView
  late Timer? _timer;
  RxInt countdown = 5.obs;
  Future<void> goToInitialView() async {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) async {
      if (countdown.value > 0) {
        countdown.value--;
        log(countdown.value.toString());
      } else {
        _timer?.cancel();
        return await Get.offAll(() {
          return const InitialView();
        });
      }
    });
  }

  @override
  void dispose() {
    /// TODO : dispose
    _timer?.cancel();
    Get.delete<RegisterController>();
    super.dispose();
  }
}
