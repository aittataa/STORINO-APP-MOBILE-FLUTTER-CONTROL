import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_svg/svg.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";

import "../../../config/constants/app_constant.dart";
import "../../../config/functions/app_function.dart";
import "../../../config/messages/app_message.dart";
import "../../../config/themes/app_theme.dart";
import "../../../config/translations/app_translation.dart";
import "../../../shared/header_bar.dart";
import "../../../shared/load_bar.dart";
import "../../../shared/progress_bar.dart";
import "../controllers/register_controller.dart";

class SuccessView extends GetView<RegisterController> {
  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    /// TODO : Page Controller
    Get.lazyPut<RegisterController>(() => RegisterController());

    /// TODO : App Theme
    final ThemeData appTheme = Theme.of(context);

    /// TODO : isTablet
    final bool isTablet = context.isTablet;
    final double toolbarHeight = isTablet ? AppConstant.tabletBarHeight : AppConstant.phoneBarHeight;

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
      child: Obx(() {
        final bool anAsyncCall = controller.anAsyncCall.value;
        return ProgressBar(
          anAsyncCall: anAsyncCall,
          progressColor: appTheme.colorScheme.surface,
          progressIndicator: const LoadBar(spinner: Spinner.SpinKitFadingCircle, color: AppTheme.main_color_1),
          child: Scaffold(
            extendBody: false,
            extendBodyBehindAppBar: false,
            backgroundColor: appTheme.colorScheme.onSurface,
            appBar: _Header(toolbarHeight: toolbarHeight),
            body: const _Body(),
          ),
        );
      }),
    );
  }
}

class _Header extends GetView<RegisterController> implements PreferredSizeWidget {
  final double toolbarHeight;

  const _Header({this.toolbarHeight = kToolbarHeight});

  @override
  Widget build(BuildContext context) {
    /// TODO : App Theme
    final ThemeData appTheme = Theme.of(context);

    /// TODO : isRightToLeft
    final bool isRightToLeft = AppFunction.isRightToLeft;
    final String asset_next_icon = isRightToLeft ? AppMessage.asset_icon_left : AppMessage.asset_icon_right;

    /// TODO : isTablet
    final bool isTablet = context.isTablet;
    final double toolbarHeight = isTablet ? AppConstant.tabletBarHeight : AppConstant.phoneBarHeight;

    ///
    return HeaderBar(
      toolbarHeight: toolbarHeight,
      color: appTheme.colorScheme.onSurface,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}

class _Body extends GetView<RegisterController> {
  const _Body();

  @override
  Widget build(BuildContext context) {
    /// TODO : App Theme
    final ThemeData appTheme = Theme.of(context);

    /// TODO : isTablet
    final bool isTablet = context.isTablet;
    final double screenWidth = isTablet ? AppConstant.screenTablet : AppConstant.screenWidth;
    final double size = screenWidth * .50;
    final double width = screenWidth * .75;
    final double height = screenWidth * .50;

    ///
    return SingleChildScrollView(
      controller: controller.scrollController_2,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: SafeArea(
        child: Column(
          spacing: 10,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              width: width,
              height: height,
              child: SvgPicture.asset(
                AppMessage.asset_icon_success,
                color: AppTheme.main_color_1,
                width: size,
                height: size,
              ),
            ),

            ListTile(
              dense: true,
              minTileHeight: 50,
              minLeadingWidth: 0,
              minVerticalPadding: 0,
              horizontalTitleGap: 0,
              contentPadding: EdgeInsets.zero,
              title: Text(
                AppKeys.labelSuccess.name.tr, //
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: appTheme.textTheme.displayLarge!.color!,
                  fontWeight: FontWeight.bold,
                  letterSpacing: .5,
                  fontSize: 25,
                ),
              ),
            ),
            ListTile(
              dense: true,
              minTileHeight: 50,
              minLeadingWidth: 0,
              minVerticalPadding: 0,
              horizontalTitleGap: 0,
              contentPadding: EdgeInsets.zero,
              title: Text(
                AppKeys.labelSuccessDesc.name.tr,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: appTheme.textTheme.displayLarge!.color!.withValues(alpha: .75),
                  fontWeight: FontWeight.w600,
                  letterSpacing: .5,
                  fontSize: 15,
                ),
              ),
            ),

            ListTile(
              dense: true,
              minTileHeight: 50,
              minLeadingWidth: 0,
              minVerticalPadding: 0,
              horizontalTitleGap: 0,
              contentPadding: EdgeInsets.zero,
              title: Obx(() {
                final int countdown = controller.countdown.value;
                return Text(
                  "${AppKeys.labelRedirection.name.tr} \n $countdown ${AppKeys.labelSecondes.name.tr}",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: AppTheme.main_color_1,
                    fontWeight: FontWeight.w600,
                    letterSpacing: .5,
                    fontSize: 15,
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
