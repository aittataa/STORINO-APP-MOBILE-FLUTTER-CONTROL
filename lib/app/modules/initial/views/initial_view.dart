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
import "../../../data/models/products.dart";
import "../../../shared/header_bar.dart";
import "../../../shared/image_view.dart";
import "../../../shared/scrolled_bar.dart";
import "../controllers/initial_controller.dart";
import "../wigdets/product_shape.dart";
import "details_view.dart";
import "products_view.dart";

class InitialView extends GetView<InitialController> {
  const InitialView({super.key});

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
      color: AppTheme.transparent_color,
      leading: SvgPicture.asset(AppMessage.asset_app_icon, color: AppTheme.main_color_1, width: 50, height: 50),
      title: ListTile(
        dense: true,
        minTileHeight: 75,
        minLeadingWidth: 0,
        minVerticalPadding: 0,
        horizontalTitleGap: 0,
        contentPadding: EdgeInsets.zero,

        leading: const SizedBox.shrink(),
        title: Text(
          AppKeys.labelWelcome.name.tr,
          textAlign: TextAlign.start,
          style: GoogleFonts.poppins(
            color: appTheme.textTheme.displayLarge!.color!,
            fontWeight: FontWeight.w500,
            letterSpacing: .5,
            fontSize: 15,
          ),
        ),
        subtitle: Text(
          AppKeys.app_title.name.tr,
          textAlign: TextAlign.start,
          style: GoogleFonts.poppins(
            color: appTheme.textTheme.displayLarge!.color!,
            fontWeight: FontWeight.bold,
            letterSpacing: .5,
            fontSize: 20,
          ),
        ),
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
    final double width = screenWidth * .75;
    final double height = screenWidth * .75;

    ///
    return Obx(() {
      final bool anAsyncCall = controller.anAsyncCall.value;
      if (anAsyncCall) return const _LoadBar();
      final List<Products> products = controller.products;
      return ScrolledBar(
        controller: controller.scrollController_1,
        child: SingleChildScrollView(
          controller: controller.scrollController_1,
          padding: const EdgeInsets.symmetric(vertical: 10),

          child: SafeArea(
            child: Column(
              spacing: 10,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                /// TODO : Featured
                ListTile(
                  dense: true,
                  minTileHeight: 25,
                  minLeadingWidth: 0,
                  minVerticalPadding: 0,
                  horizontalTitleGap: 0,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                  title: Text(
                    AppKeys.labelFeatured.name.tr,
                    textAlign: TextAlign.start,
                    style: GoogleFonts.poppins(
                      color: appTheme.textTheme.displayLarge!.color!,
                      fontWeight: FontWeight.bold,
                      letterSpacing: .5,
                      fontSize: 17.5,
                    ),
                  ),
                ),
                SizedBox(
                  width: screenWidth,
                  height: screenHeight * .25,
                  child: PageView.builder(
                    padEnds: false,
                    pageSnapping: true,
                    onPageChanged: controller.onPageChanged_1,
                    controller: controller.pageController_1,
                    itemCount: 5,
                    itemBuilder: (_, int i) {
                      final Products product = products[i];
                      return GestureDetector(
                        onTap: () async {
                          controller.product.value = product;
                          return await Get.to(() {
                            return const DetailsView();
                          });
                        },
                        child: AnimatedContainer(
                          curve: AppConstant.curve,
                          duration: AppConstant.duration_animated_container,
                          margin: const EdgeInsets.only(left: 15, right: 5),
                          decoration: BoxDecoration(
                            color: appTheme.colorScheme.onSurface,
                            shape: BoxShape.rectangle,
                            borderRadius: AppConstant.radiusAll,
                            boxShadow: <BoxShadow>[
                              AppFunction.boxShadow(appTheme.colorScheme.shadow.withValues(alpha: .1)),
                            ],
                          ),
                          child: Stack(
                            fit: StackFit.expand,
                            alignment: AlignmentGeometry.center,
                            children: <Widget>[
                              ImageView(
                                imageUrl: product.images.first,
                                radius: AppConstant.defaultRadius,
                                backColor: appTheme.colorScheme.onSurface,
                              ),

                              ///
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: AppConstant.radiusAll,
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight,
                                    colors: <Color>[
                                      AppTheme.main_color_1.withValues(alpha: .750),
                                      AppTheme.main_color_1.withValues(alpha: .500),
                                      // AppTheme.main_color_1.withValues(alpha: .250),
                                      AppTheme.main_color_1.withValues(alpha: .250),
                                      AppTheme.main_color_1.withValues(alpha: .125),
                                      //AppTheme.transparent_color,
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                    decoration: BoxDecoration(
                                      color: AppTheme.transparent_color,
                                      borderRadius: AppConstant.radiusAll,
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                          color: AppTheme.main_color_1.withValues(alpha: .75),
                                          offset: const Offset(10, 10),
                                          blurRadius: 25,
                                          spreadRadius: 5,
                                          blurStyle: BlurStyle.normal,
                                        ),
                                        BoxShadow(
                                          color: AppTheme.main_color_1.withValues(alpha: .50),
                                          offset: const Offset(-10, -10),
                                          blurRadius: 25,
                                          spreadRadius: 5,
                                          blurStyle: BlurStyle.normal,
                                        ),
                                      ],
                                    ),
                                    child: Text(
                                      product.title.toString(),
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                        color: AppTheme.text_color_2,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: .5,
                                        fontSize: 30,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                ListTile(
                  dense: true,
                  minTileHeight: 10,
                  minLeadingWidth: 0,
                  minVerticalPadding: 0,
                  horizontalTitleGap: 0,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  title: Row(
                    spacing: 2.5,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List<Widget>.generate(5, (int i) {
                      return Obx(() {
                        final int selectedIndex = controller.selectedIndex_1.value;
                        final bool selected = selectedIndex == i;
                        return AnimatedContainer(
                          width: selected ? 30 : 10,
                          height: 10,
                          curve: AppConstant.curve,
                          duration: AppConstant.duration_animated_container,
                          decoration: BoxDecoration(
                            color: selected ? AppTheme.main_color_1 : appTheme.iconTheme.color!.withValues(alpha: .25),
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

                /// TODO : BestSelling
                ListTile(
                  dense: true,
                  minTileHeight: 50,
                  minLeadingWidth: 0,
                  minVerticalPadding: 0,
                  horizontalTitleGap: 0,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                  title: Text(
                    AppKeys.labelBestSelling.name.tr,
                    textAlign: TextAlign.start,
                    style: GoogleFonts.poppins(
                      color: appTheme.textTheme.displayLarge!.color!,
                      fontWeight: FontWeight.bold,
                      letterSpacing: .5,
                      fontSize: 17.5,
                    ),
                  ),
                  trailing: GestureDetector(
                    onTap: () async {
                      controller.title.value = AppKeys.labelBestSelling.name.tr;
                      return await Get.to(() {
                        return const ProductsView();
                      });
                    },
                    child: Text(
                      AppKeys.labelSeeAll.name.tr,
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        color: appTheme.textTheme.displayLarge!.color!.withValues(alpha: .5),
                        fontWeight: FontWeight.w500,
                        letterSpacing: .5,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: screenWidth,
                  height: screenHeight * .325,
                  child: GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    controller: controller.scrollController_2,
                    itemCount: products.length,
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                    gridDelegate: AppFunction.gridDelegate(crossAxisCount: 1, spacing: 10, childAspectRatio: 1.5),
                    itemBuilder: (_, int i) {
                      final Products product = products[i];
                      return ProductShape(product: product);
                    },
                  ),
                ),

                /// TODO : Recent
                ListTile(
                  dense: true,
                  minTileHeight: 50,
                  minLeadingWidth: 0,
                  minVerticalPadding: 0,
                  horizontalTitleGap: 0,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                  title: Text(
                    AppKeys.labelRecentProducts.name.tr,
                    textAlign: TextAlign.start,
                    style: GoogleFonts.poppins(
                      color: appTheme.textTheme.displayLarge!.color!,
                      fontWeight: FontWeight.bold,
                      letterSpacing: .5,
                      fontSize: 17.5,
                    ),
                  ),
                  trailing: GestureDetector(
                    onTap: () async {
                      controller.title.value = AppKeys.labelRecentProducts.name.tr;
                      return await Get.to(() {
                        return const ProductsView();
                      });
                    },
                    child: Text(
                      AppKeys.labelSeeAll.name.tr,
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        color: appTheme.textTheme.displayLarge!.color!.withValues(alpha: .5),
                        fontWeight: FontWeight.w500,
                        letterSpacing: .5,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: screenWidth,
                  height: screenHeight * .20,
                  child: ListView.separated(
                    shrinkWrap: true,
                    controller: controller.scrollController_3,
                    itemCount: products.length,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                    separatorBuilder: (_, _) => const SizedBox(width: 10),
                    itemBuilder: (_, int i) {
                      final Products product = products[i];
                      return GestureDetector(
                        onTap: () {
                          controller.product.value = product;
                          Get.to(() {
                            return const DetailsView();
                          });
                        },
                        child: AnimatedContainer(
                          width: screenHeight * .20,
                          height: screenHeight * .20,
                          curve: AppConstant.curve,
                          duration: AppConstant.duration_animated_container,
                          //padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                            color: appTheme.colorScheme.onSurface,
                            shape: BoxShape.rectangle,
                            borderRadius: AppConstant.radiusAll,
                            boxShadow: <BoxShadow>[
                              AppFunction.boxShadow(appTheme.colorScheme.shadow.withValues(alpha: .1)),
                            ],
                          ),
                          child: Column(
                            spacing: 0,
                            children: <Widget>[
                              Expanded(
                                child: ImageView(
                                  imageUrl: product.images.first.toString(),
                                  radius: AppConstant.defaultRadius - 7.5,
                                  backColor: AppTheme.transparent_color,
                                ),
                              ),

                              ///
                              ListTile(
                                dense: true,
                                minTileHeight: 25,
                                minLeadingWidth: 0,
                                minVerticalPadding: 0,
                                horizontalTitleGap: 0,
                                contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                title: Text(
                                  product.title.toString(),
                                  maxLines: 1,
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    color: appTheme.textTheme.displayLarge!.color,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: .5,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
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
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          spacing: 10,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            /// TODO : Featured
            ListTile(
              dense: true,
              minTileHeight: 25,
              minLeadingWidth: 0,
              minVerticalPadding: 0,
              horizontalTitleGap: 0,
              contentPadding: EdgeInsets.zero,
              title: Container(
                decoration: const BoxDecoration(
                  color: AppTheme.base_color,
                  borderRadius: AppConstant.radiusAll,
                ),
                child: Text(
                  AppKeys.labelFeatured.name.tr,
                  textAlign: TextAlign.start,
                  style: GoogleFonts.poppins(
                    color: AppTheme.transparent_color,
                    fontWeight: FontWeight.bold,
                    letterSpacing: .5,
                    fontSize: 17.5,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: screenWidth,
              height: screenHeight * .25,
              child: AnimatedContainer(
                curve: AppConstant.curve,
                duration: AppConstant.duration_animated_container,
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: AppTheme.red_color,
                  shape: BoxShape.rectangle,
                  borderRadius: AppConstant.radiusAll,
                  boxShadow: <BoxShadow>[
                    AppFunction.boxShadow(AppTheme.base_color),
                  ],
                ),
              ),
            ),
            ListTile(
              dense: true,
              minTileHeight: 10,
              minLeadingWidth: 0,
              minVerticalPadding: 0,
              horizontalTitleGap: 0,
              contentPadding: EdgeInsets.zero,
              title: Row(
                spacing: 2.5,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List<Widget>.generate(5, (int i) {
                  return AnimatedContainer(
                    width: i == 2 ? 30 : 10,
                    height: 10,
                    curve: AppConstant.curve,
                    duration: AppConstant.duration_animated_container,
                    decoration: BoxDecoration(
                      color: AppTheme.base_color,
                      shape: BoxShape.rectangle,
                      borderRadius: AppConstant.radiusAll,
                      boxShadow: <BoxShadow>[
                        AppFunction.boxShadow(AppTheme.base_color),
                      ],
                    ),
                  );
                }),
              ),
            ),

            /// TODO : BestSelling
            ListTile(
              dense: true,
              minTileHeight: 50,
              minLeadingWidth: 0,
              minVerticalPadding: 0,
              horizontalTitleGap: 0,
              contentPadding: EdgeInsets.zero,
              title: Container(
                decoration: const BoxDecoration(
                  color: AppTheme.base_color,
                  borderRadius: AppConstant.radiusAll,
                ),
                child: Text(
                  AppKeys.labelBestSelling.name.tr,
                  textAlign: TextAlign.start,
                  style: GoogleFonts.poppins(
                    color: AppTheme.transparent_color,
                    fontWeight: FontWeight.bold,
                    letterSpacing: .5,
                    fontSize: 17.5,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: screenWidth,
              height: screenHeight * .325,
              child: GridView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                gridDelegate: AppFunction.gridDelegate(crossAxisCount: 1, spacing: 10, childAspectRatio: 1.5),
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

            /// TODO : Recent
            ListTile(
              dense: true,
              minTileHeight: 50,
              minLeadingWidth: 0,
              minVerticalPadding: 0,
              horizontalTitleGap: 0,
              contentPadding: EdgeInsets.zero,
              title: Container(
                decoration: const BoxDecoration(
                  color: AppTheme.base_color,
                  borderRadius: AppConstant.radiusAll,
                ),
                child: Text(
                  AppKeys.labelRecentProducts.name.tr,
                  textAlign: TextAlign.start,
                  style: GoogleFonts.poppins(
                    color: AppTheme.base_color,
                    fontWeight: FontWeight.bold,
                    letterSpacing: .5,
                    fontSize: 17.5,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: screenWidth,
              height: screenHeight * .20,
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                separatorBuilder: (_, _) => const SizedBox(width: 10),
                itemBuilder: (_, int i) {
                  return AnimatedContainer(
                    width: screenHeight * .20,
                    height: screenHeight * .20,
                    curve: AppConstant.curve,
                    duration: AppConstant.duration_animated_container,
                    decoration: BoxDecoration(
                      color: AppTheme.base_color,
                      shape: BoxShape.rectangle,
                      borderRadius: AppConstant.radiusAll,
                      boxShadow: <BoxShadow>[
                        AppFunction.boxShadow(AppTheme.base_color),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
