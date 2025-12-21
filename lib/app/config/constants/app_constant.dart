// import "package:country_picker/country_picker.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class AppConstant {
  AppConstant._();

  /// TODO : Screen Size
  static double screenWidth = Get.width;
  static double screenHeight = Get.height;
  static double screenTablet = screenWidth * .75;
  static const double phoneBarHeight = 75;
  static const double tabletBarHeight = 100;

  static const Curve curve = Curves.fastLinearToSlowEaseIn;
  static const Transition default_transition = Transition.noTransition;
  static const Duration duration = Duration();
  static const Duration duration_delay = Duration(milliseconds: 500);
  static const Duration duration_spinner = Duration(milliseconds: 1500);
  static const Duration duration_animation = Duration(milliseconds: 2500);
  static const Duration duration_transition = Duration(milliseconds: 250);
  static const Duration duration_animated_container = Duration(milliseconds: 2500);
  static const Duration duration_animated_opacity = Duration(milliseconds: 1500);

  /// TODO : Default Padding
  static const double defaultPadding = 10;
  static const EdgeInsets paddingAll = EdgeInsets.symmetric(horizontal: 20, vertical: 10);

  /// TODO : Default Radius
  static const double defaultRadius = 15;
  static const BorderRadius radiusAll = BorderRadius.all(Radius.circular(AppConstant.defaultRadius));
}
