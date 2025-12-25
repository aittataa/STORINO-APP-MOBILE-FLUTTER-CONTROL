import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:get/get.dart";
import "package:shimmer/shimmer.dart";

import "../../../config/constants/app_constant.dart";
import "../../../config/functions/app_function.dart";
import "../../../config/messages/app_message.dart";
import "../../../config/themes/app_theme.dart";
import "../../../data/models/products.dart";
import "../../../shared/header_bar.dart";
import "../../../shared/scrolled_bar.dart";
import "../controllers/initial_controller.dart";
import "../widgets/product_shape.dart";
import "initial_view.dart";
import "orders_view.dart";

class ProductsView extends GetView<InitialController> {
  const ProductsView({super.key});
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
      leading: HeadIcon(
        asset: asset_back_icon,
        color: appTheme.iconTheme.color!,
        size: 25,
        onTap: () async {
          if (Navigator.canPop(context)) {
            return Navigator.pop(context);
          }
          return await Get.offAll(() {
            return const InitialView();
          });
        },
      ),
      title: Builder(
        builder: (_) {
          final String title = controller.title.value;
          return HeadTitle(title: title);
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
      final bool anAsyncCall = controller.anAsyncCall.value;
      if (anAsyncCall) return const _LoadBar();
      final List<Products> products = controller.products;
      return ScrolledBar(
        controller: controller.scrollController_3,
        child: SingleChildScrollView(
          controller: controller.scrollController_3,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: SafeArea(
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: products.length,
              gridDelegate: AppFunction.gridDelegate(
                crossAxisCount: 2,
                childAspectRatio: .75,
                spacing: 10,
              ),
              itemBuilder: (_, int i) {
                final Products product = products[i];
                return ProductShape(product: product);
              },
            ),
          ),
        ),
      );
    });
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
