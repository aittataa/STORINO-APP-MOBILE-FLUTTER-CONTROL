import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_svg/svg.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";
import "package:shimmer/shimmer.dart";

import "../../../config/constants/app_constant.dart";
import "../../../config/functions/app_function.dart";
import "../../../config/messages/app_message.dart";
import "../../../config/themes/app_theme.dart";
import "../../../config/translations/app_translation.dart";
import "../../../shared/header_bar.dart";
import "../../../shared/load_bar.dart";
import "../../../shared/outline_button.dart";
import "../../../shared/progress_bar.dart";
import "../controllers/initial_controller.dart";
import "initial_view.dart";

class ValidationsView extends GetView<InitialController> {
  const ValidationsView({super.key});
  @override
  Widget build(BuildContext context) {
    /// TODO : Page Controller
    Get.lazyPut<InitialController>(() => InitialController());

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
            appBar: _Header(toolbarHeight: toolbarHeight),
            body: const _Body(),
            bottomNavigationBar: const _Footer(),
          ),
        );
      }),
    );
  }
}

class _Header extends GetView<InitialController> implements PreferredSizeWidget {
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
      leading: HeadIcon(
        onTap: () async {
          if (Navigator.canPop(context)) {
            return Navigator.pop(context);
          }
          return await Get.offAll(() {
            return const InitialView();
          });
        },
        asset: asset_back_icon,
        color: appTheme.iconTheme.color!,
        size: 25,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}

class _Body extends GetView<InitialController> {
  const _Body();

  @override
  Widget build(BuildContext context) {
    /// TODO : App Theme
    final ThemeData appTheme = Theme.of(context);

    /// TODO : isTablet
    final bool isTablet = context.isTablet;
    final double screenWidth = isTablet ? AppConstant.screenTablet : AppConstant.screenWidth;
    final double screenHeight = isTablet ? AppConstant.screenHeight : AppConstant.screenHeight;
    final double width = screenWidth * .5;
    final double height = screenWidth * .5;

    ///
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: isTablet ? 50 : 15,
        vertical: isTablet ? 25 : 10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            AppMessage.asset_icon_success,
            color: AppTheme.green_color,
            width: width,
            height: height,
          ),
          ListTile(
            dense: true,
            minTileHeight: 100,
            minLeadingWidth: 0,
            minVerticalPadding: 0,
            horizontalTitleGap: 0,
            contentPadding: EdgeInsets.zero,
            title: Text(
              AppKeys.labelSuccess.name.tr,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: AppTheme.red_color,
                fontWeight: FontWeight.bold,
                letterSpacing: .5,
                fontSize: 25,
              ),
            ),
            subtitle: Text(
              AppKeys.labelValidatedOrders.name.tr,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: appTheme.textTheme.displayLarge!.color!.withValues(alpha: .75),
                fontWeight: FontWeight.w500,
                letterSpacing: .5,
                fontSize: 17.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Footer extends GetView<InitialController> {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    /// TODO : Page Controller
    Get.lazyPut<InitialController>(() => InitialController());

    /// TODO : App Theme
    final ThemeData appTheme = Theme.of(context);

    /// TODO : isTablet
    final bool isTablet = context.isTablet;
    final double size = isTablet ? 40 : 30;

    ///
    return Container(
      decoration: BoxDecoration(
        color: appTheme.colorScheme.onSurface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(AppConstant.defaultRadius)),
        border: Border(top: BorderSide(color: appTheme.colorScheme.outline.withValues(alpha: .1))),
      ),
      child: ListTile(
        dense: true,
        minTileHeight: 0,
        minLeadingWidth: 0,
        minVerticalPadding: 0,
        horizontalTitleGap: 0,
        contentPadding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        title: OutlineButton(
          onPressed: () async {
            return await Get.offAll(() {
              return const InitialView();
            });
          },
          label: AppKeys.labelContinueShopping.name.tr,
          radius: AppConstant.defaultRadius - 6,
        ),
      ),
    );
  }
}

class _LoadBar extends StatelessWidget {
  const _LoadBar();

  @override
  Widget build(BuildContext context) {
    ///
    final bool isTablet = context.isTablet;
    final double screenWidth = isTablet ? AppConstant.screenTablet : AppConstant.screenWidth;
    final double screenHeight = isTablet ? AppConstant.screenHeight : AppConstant.screenHeight;
    final double width = screenWidth * .75;
    final double height = screenWidth * .75;

    ///
    return Shimmer.fromColors(
      baseColor: AppTheme.base_color,
      highlightColor: AppTheme.highlight_color,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: SafeArea(
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: 10,
            gridDelegate: AppFunction.gridDelegate(
              crossAxisCount: 2,
              childAspectRatio: .75,
              spacing: 10,
            ),
            itemBuilder: (_, int i) {
              return AnimatedContainer(
                curve: AppConstant.curve,
                duration: AppConstant.duration_animated_container,
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                  color: AppTheme.base_color,
                  shape: BoxShape.rectangle,
                  borderRadius: const BorderRadius.all(Radius.circular(AppConstant.defaultRadius)),
                  boxShadow: <BoxShadow>[
                    AppFunction.boxShadow(AppTheme.base_color),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
