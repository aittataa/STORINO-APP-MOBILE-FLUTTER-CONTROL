import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:get/get.dart";
import "package:storino/app/config/themes/app_theme.dart";

import "../../../config/constants/app_constant.dart";
import "../../../config/messages/app_message.dart";
import "../../../routes/app_pages.dart";
import "../controllers/splash_controller.dart";

class Splash extends GetView<SplashController> {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    ///  TODO : Page Controller
    Get.lazyPut<SplashController>(() => SplashController());

    ///  TODO : App Theme
    final ThemeData appTheme = Theme.of(context);

    /// TODO : isTablet
    final bool isTablet = context.isTablet;
    final double screenHeight = isTablet ? AppConstant.screenHeight : AppConstant.screenHeight;
    final double screenWidth = isTablet ? AppConstant.screenTablet : AppConstant.screenWidth;
    final double height = screenHeight * .75;
    final double width = screenWidth * .75;

    /// TODO : isDarkMode
    final bool isDarkMode = context.isDarkMode;
    final String asset_app_icon = isDarkMode ? AppMessage.asset_icon_dark : AppMessage.asset_icon_light;

    ///
    return SafeArea(
      child: Padding(
        padding: AppConstant.paddingAll,
        child: Center(
          child: Hero(
            tag: Routes.SPLASH,
            child: SvgPicture.asset(
              asset_app_icon,
              width: width,
              height: height,
              color: AppTheme.main_color_1,
            ),
          ),
        ),
      ),
    );
  }
}
