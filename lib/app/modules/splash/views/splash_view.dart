import "package:animated_splash_screen/animated_splash_screen.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:get/get.dart";
import "package:page_transition/page_transition.dart";

import "../../../config/constants/app_constant.dart";
import "../../../config/functions/app_function.dart";
import "../controllers/splash_controller.dart";
import "../widgets/splash.dart";

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  ///
  @override
  Widget build(BuildContext context) {
    /// TODO : Page Controller
    Get.lazyPut<SplashController>(() => SplashController());

    /// TODO : AppTheme
    final ThemeData appTheme = Theme.of(context);

    /// TODO : isTablet
    final bool isTablet = context.isTablet;

    /// TODO : isDarkMode
    final bool isDarkMode = context.isDarkMode;
    final SystemUiOverlayStyle systemUiOverlayStyle = AppFunction.systemUiOverlayStyle(
      appTheme.colorScheme.onSurface,
      mode: isDarkMode ? Brightness.light : Brightness.dark,
      isDarkMode: isDarkMode,
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);

    ///
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: systemUiOverlayStyle,
      child: AnimatedSplashScreen.withScreenFunction(
        screenFunction: () => controller.screenFunction(context),
        centered: true,
        disableNavigation: true,
        curve: AppConstant.curve,
        duration: AppConstant.duration_animation.inMilliseconds,
        animationDuration: AppConstant.duration_animation,
        backgroundColor: appTheme.colorScheme.onSurface,
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
        splashIconSize: double.infinity,
        splash: const Splash(),
      ),
    );
  }
}
