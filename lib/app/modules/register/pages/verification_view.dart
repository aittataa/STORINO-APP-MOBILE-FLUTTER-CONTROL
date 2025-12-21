import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_svg/svg.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";
import "package:pinput/pinput.dart";

import "../../../config/constants/app_constant.dart";
import "../../../config/functions/app_function.dart";
import "../../../config/messages/app_message.dart";
import "../../../config/themes/app_theme.dart";
import "../../../config/translations/app_translation.dart";
import "../../../shared/edit_text.dart";
import "../../../shared/header_bar.dart";
import "../../../shared/load_bar.dart";
import "../../../shared/progress_bar.dart";
import "../../../shared/scrolled_bar.dart";
import "../controllers/register_controller.dart";

class VerificationView extends GetView<RegisterController> {
  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    /// TODO : Page Controller
    Get.lazyPut<RegisterController>(() => RegisterController());

    /// TODO : App Theme
    final ThemeData appTheme = Theme.of(context);

    /// TODO : isRightToLeft
    final bool isRightToLeft = AppFunction.isRightToLeft;
    final String asset_next_icon = isRightToLeft ? AppMessage.asset_icon_left : AppMessage.asset_icon_right;

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
            floatingActionButton: const _Floating(),
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
    final String asset_back_icon = isRightToLeft ? AppMessage.asset_icon_right : AppMessage.asset_icon_left;

    /// TODO : isTablet
    final bool isTablet = context.isTablet;
    final double toolbarHeight = isTablet ? AppConstant.tabletBarHeight : AppConstant.phoneBarHeight;

    ///
    return HeaderBar(
      toolbarHeight: toolbarHeight,
      color: appTheme.colorScheme.onSurface,
      leading: HeadIcon(
        asset: asset_back_icon,
        size: 25,
        color: appTheme.iconTheme.color!,
        onTap: () => <void>{Navigator.pop(context)},
      ),
      title: HeadTitle(
        title: AppKeys.labelVerificationCode.name.tr,
        color: appTheme.textTheme.displayLarge!.color,
        fontSize: 15,
      ),
      trailing: HeadIcon(
        asset: asset_back_icon,
        size: 25,
        color: AppTheme.transparent_color,
      ),
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
    final double screenHeight = isTablet ? AppConstant.screenHeight : AppConstant.screenHeight;
    final double screenWidth = isTablet ? AppConstant.screenTablet : AppConstant.screenWidth;
    final double width = screenWidth * .5;
    final double height = screenWidth * .5;
    final double boxSize = isTablet ? 60 : 52.5;
    final double iconSize = isTablet ? 30 : 27.5;

    ///
    return ScrolledBar(
      controller: controller.scrollController_2,
      child: SingleChildScrollView(
        controller: controller.scrollController_2,
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: SafeArea(
          child: Column(
            spacing: 10,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: width,
                height: height,
                child: SvgPicture.asset(
                  AppMessage.asset_app_icon,
                  color: AppTheme.main_color_1,
                  width: width,
                  height: height,
                ),
              ),
              ListTile(
                dense: true,
                minTileHeight: 100,
                minLeadingWidth: 0,
                minVerticalPadding: 0,
                horizontalTitleGap: 0,
                contentPadding: EdgeInsets.zero,
                title: Text(
                  AppKeys.labelVerificationCode.name.tr,
                  textAlign: TextAlign.start,
                  style: GoogleFonts.poppins(
                    color: appTheme.textTheme.displayLarge!.color!,
                    fontWeight: FontWeight.bold,
                    letterSpacing: .5,
                    fontSize: 17.5,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    AppKeys.labelVerificationCodeDesc.name.tr,
                    textAlign: TextAlign.start,
                    style: GoogleFonts.poppins(
                      color: appTheme.textTheme.displayLarge!.color!,
                      fontWeight: FontWeight.w500,
                      letterSpacing: .5,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              Form(
                key: controller.formKey_2,
                child: Pinput(
                  controller: controller.pinController,
                  length: 6,
                  showCursor: false,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  autofocus: true,
                  textCapitalization: TextCapitalization.none,

                  textInputAction: TextInputAction.done,

                  autofillHints: const <String>[
                    AutofillHints.oneTimeCode,
                  ],
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                    FilteringTextInputFormatter.allow(RegExp(r"[0-9]")),
                  ],
                  defaultPinTheme: pinTheme(
                    appTheme.textTheme.displayLarge!.color!,
                    appTheme.colorScheme.surface,
                    appTheme.colorScheme.outline.withValues(alpha: .75),
                  ),
                  followingPinTheme: pinTheme(
                    appTheme.textTheme.displayLarge!.color!,
                    appTheme.colorScheme.surface,
                    appTheme.colorScheme.outline.withValues(alpha: .75),
                  ),
                  focusedPinTheme: pinTheme(
                    appTheme.textTheme.displayLarge!.color!,
                    appTheme.colorScheme.surface,
                    AppTheme.main_color_1,
                  ),
                  submittedPinTheme: pinTheme(
                    appTheme.textTheme.displayLarge!.color!,
                    appTheme.colorScheme.surface,
                    AppTheme.main_color_1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Floating extends GetView<RegisterController> {
  const _Floating();

  @override
  Widget build(BuildContext context) {
    /// TODO : App Theme
    final ThemeData appTheme = Theme.of(context);

    /// TODO : isRightToLeft
    final bool isRightToLeft = AppFunction.isRightToLeft;
    final String asset_next_icon = isRightToLeft ? AppMessage.asset_icon_left : AppMessage.asset_icon_right;

    ///
    return FloatingActionButton(
      backgroundColor: AppTheme.main_color_1,
      foregroundColor: AppTheme.main_color_1,
      focusColor: AppTheme.transparent_color,
      splashColor: AppTheme.transparent_color,
      hoverColor: AppTheme.transparent_color,
      elevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      disabledElevation: 0,
      hoverElevation: 0,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(AppConstant.defaultRadius))),
      child: SvgPicture.asset(
        asset_next_icon,
        color: AppTheme.icon_color_2,
        width: 25,
        height: 25,
      ),
      onPressed: () => controller.goToSuccessView(),
    );
  }
}
