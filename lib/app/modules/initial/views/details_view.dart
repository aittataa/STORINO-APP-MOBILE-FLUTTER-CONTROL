import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";
import "package:storino/app/shared/outline_button.dart";

import "../../../config/constants/app_constant.dart";
import "../../../config/functions/app_function.dart";
import "../../../config/messages/app_message.dart";
import "../../../config/themes/app_theme.dart";
import "../../../config/translations/app_translation.dart";
import "../../../data/models/products.dart";
import "../../../shared/header_bar.dart";
import "../../../shared/image_view.dart";
import "../../../shared/scrolled_bar.dart";
import "../controllers/initial_controller.dart";
import "initial_view.dart";
import "orders_view.dart";

class DetailsView extends GetView<InitialController> {
  const DetailsView({super.key});

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
      appTheme.colorScheme.surface,
      mode: isDarkMode ? Brightness.light : Brightness.dark,
      isDarkMode: isDarkMode,
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);

    ///
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: systemUiOverlayStyle,
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: _Header(toolbarHeight: toolbarHeight),
        body: const _Body(),
      ),
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
      color: appTheme.colorScheme.onSurface.withValues(alpha: .25),
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
      title: Builder(
        builder: (_) {
          final Products product = controller.product.value;
          return HeadTitle(title: product.title.toString());
        },
      ),
      trailing: HeadIcon(
        asset: AppMessage.asset_icon_cart,
        color: appTheme.iconTheme.color!,
        size: 25,
        onTap: () async {
          return await Get.to(() {
            return const OrdersView();
          });
        },
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

    ///
    return Obx(() {
      final List<Products> orders = controller.orders;
      final Products product = controller.product.value;
      final bool productInCart = orders.where((Products value) => value.id == product.id).toList().isNotEmpty;

      ///
      return ScrolledBar(
        controller: controller.scrollController_2,
        child: SingleChildScrollView(
          controller: controller.scrollController_2,
          padding: EdgeInsets.zero,
          child: Column(
            spacing: 10,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Builder(
                builder: (_) {
                  final List<String> images = product.images;
                  return Column(
                    spacing: 10,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: screenWidth,
                        height: screenHeight * .45,
                        child: PageView.builder(
                          padEnds: false,
                          pageSnapping: true,
                          onPageChanged: controller.onPageChanged_1,
                          itemCount: controller.products.length,
                          itemBuilder: (_, int i) {
                            final String image = images[i];
                            return AnimatedContainer(
                              curve: AppConstant.curve,
                              duration: AppConstant.duration_animated_container,
                              child: ImageView(
                                imageUrl: image,
                                radius: 0,
                                backColor: appTheme.colorScheme.onSurface,
                              ),
                            );
                          },
                        ),
                      ),
                      ListTile(
                        dense: true,
                        minTileHeight: 25,
                        minLeadingWidth: 0,
                        minVerticalPadding: 0,
                        horizontalTitleGap: 0,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        title: Center(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              spacing: 2.5,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: List<Widget>.generate(images.length, (int i) {
                                return Obx(() {
                                  final int selectedIndex = controller.selectedIndex_1.value;
                                  final bool selected = selectedIndex == i;
                                  return AnimatedContainer(
                                    width: selected ? 30 : 10,
                                    height: 10,
                                    curve: AppConstant.curve,
                                    duration: AppConstant.duration_animated_container,
                                    decoration: BoxDecoration(
                                      color: selected ? AppTheme.main_color_1 : appTheme.colorScheme.onSurface,
                                      shape: BoxShape.rectangle,
                                      borderRadius: AppConstant.radiusAll,
                                      boxShadow: <BoxShadow>[
                                        AppFunction.boxShadow(appTheme.colorScheme.shadow.withValues(alpha: .1)),
                                      ],
                                    ),
                                  );
                                });
                              }),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              ListTile(
                dense: true,
                minTileHeight: 25,
                minLeadingWidth: 0,
                minVerticalPadding: 0,
                horizontalTitleGap: 0,
                contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                title: Text(
                  product.title.toString(),
                  style: GoogleFonts.poppins(
                    color: appTheme.textTheme.displayLarge!.color!,
                    fontWeight: FontWeight.bold,
                    letterSpacing: .5,
                    fontSize: 17.5,
                  ),
                ),
              ),
              ListTile(
                dense: true,
                minTileHeight: 25,
                minLeadingWidth: 0,
                minVerticalPadding: 0,
                horizontalTitleGap: 0,
                contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                title: Text(
                  product.description.toString(),
                  style: GoogleFonts.poppins(
                    color: appTheme.textTheme.displayLarge!.color!.withValues(alpha: .75),
                    fontWeight: FontWeight.w500,
                    letterSpacing: .5,
                    fontSize: 15,
                  ),
                ),
              ),
              ListTile(
                dense: true,
                minTileHeight: 25,
                minLeadingWidth: 0,
                minVerticalPadding: 0,
                horizontalTitleGap: 0,
                contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                title: Row(
                  spacing: 5,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "${AppKeys.labelQuantity.name.tr} : ",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: appTheme.textTheme.displayLarge!.color!.withValues(alpha: .75),
                        fontWeight: FontWeight.w500,
                        letterSpacing: .5,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      "${product.quantity} piece",
                      style: GoogleFonts.poppins(
                        color: AppTheme.red_color,
                        fontWeight: FontWeight.bold,
                        letterSpacing: .5,
                        fontSize: 17.5,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                dense: true,
                minTileHeight: 25,
                minLeadingWidth: 0,
                minVerticalPadding: 0,
                horizontalTitleGap: 0,
                contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                title: Text(
                  "${AppKeys.labelSizes.name.tr} : ",
                  style: GoogleFonts.poppins(
                    color: appTheme.textTheme.displayLarge!.color!.withValues(alpha: .75),
                    fontWeight: FontWeight.w500,
                    letterSpacing: .5,
                    fontSize: 15,
                  ),
                ),
                subtitle: Builder(
                  builder: (_) {
                    final List<String> sizes = product.sizes;
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        alignment: WrapAlignment.start,
                        runAlignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: .generate(sizes.length, (int i) {
                          final String size = sizes[i];
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                            decoration: BoxDecoration(
                              color: appTheme.colorScheme.onSurface,
                              shape: BoxShape.rectangle,
                              borderRadius: AppConstant.radiusAll,
                            ),
                            child: Text(
                              size,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                color: appTheme.textTheme.displayLarge!.color!.withValues(alpha: .75),
                                fontWeight: FontWeight.w600,
                                letterSpacing: .5,
                                fontSize: 17.5,
                              ),
                            ),
                          );
                        }),
                      ),
                    );
                  },
                ),
              ),
              ListTile(
                dense: true,
                minTileHeight: 25,
                minLeadingWidth: 0,
                minVerticalPadding: 0,
                horizontalTitleGap: 0,
                contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                title: OutlineButton(
                  onPressed: () => controller.handleCart(),
                  label: productInCart ? AppKeys.labelDeleteFromCart.name.tr : AppKeys.labelAddToCart.name.tr,
                  backColor: productInCart ? AppTheme.red_color : AppTheme.main_color_1,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
