import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";

import "../../../config/constants/app_constant.dart";
import "../../../config/functions/app_function.dart";
import "../../../config/themes/app_theme.dart";
import "../../../config/translations/app_translation.dart";
import "../../../data/models/products.dart";
import "../../../shared/image_view.dart";
import "../controllers/initial_controller.dart";
import "../views/details_view.dart";

class ProductShape extends GetView<InitialController> {
  final Products product;
  const ProductShape({super.key, required this.product});

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
        decoration: BoxDecoration(
          color: appTheme.colorScheme.onSurface,
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.all(Radius.circular(AppConstant.defaultRadius)),
          boxShadow: <BoxShadow>[
            AppFunction.boxShadow(appTheme.colorScheme.shadow.withValues(alpha: .1)),
          ],
        ),
        child: Column(
          spacing: 0,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(AppConstant.defaultRadius - 5)),
                child: ImageView(
                  imageUrl: product.images.first.toString(),
                  radius: 0,
                  backColor: appTheme.colorScheme.onSurface,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            ///
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                spacing: 0,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ListTile(
                    dense: true,
                    minTileHeight: 20,
                    minLeadingWidth: 0,
                    minVerticalPadding: 0,
                    horizontalTitleGap: 0,
                    contentPadding: EdgeInsets.zero,
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
                  ListTile(
                    dense: true,
                    minTileHeight: 20,
                    minLeadingWidth: 0,
                    minVerticalPadding: 0,
                    horizontalTitleGap: 0,
                    contentPadding: EdgeInsets.zero,
                    title: Row(
                      spacing: 2.5,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          spacing: 2.5,
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: List<Widget>.generate(5, (int i) {
                            return Icon(
                              CupertinoIcons.star_fill,
                              color: appTheme.iconTheme.color,
                              size: 12.5,
                            );
                          }),
                        ),
                        Icon(
                          CupertinoIcons.bubble_left,
                          color: appTheme.iconTheme.color,
                          size: 12.5,
                        ),
                        Text(
                          product.images.length.toString(),
                          maxLines: 2,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            color: appTheme.textTheme.displayLarge!.color,
                            fontWeight: FontWeight.bold,
                            letterSpacing: .5,
                            fontSize: 12.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    dense: true,
                    minTileHeight: 20,
                    minLeadingWidth: 0,
                    minVerticalPadding: 0,
                    horizontalTitleGap: 0,
                    contentPadding: EdgeInsets.zero,
                    title: Row(
                      spacing: 5,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "${product.price.toStringAsFixed(2)} ${AppKeys.app_currency.name.tr}",
                          maxLines: 2,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            color: AppTheme.red_color.withValues(alpha: .5),
                            fontWeight: FontWeight.bold,
                            letterSpacing: .5,
                            fontSize: 15,
                            decoration: TextDecoration.lineThrough,
                            decorationThickness: 2.5,
                            decorationColor: AppTheme.red_color.withValues(alpha: .5),
                            decorationStyle: TextDecorationStyle.solid,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2.5),
                          decoration: BoxDecoration(
                            color: AppTheme.red_color.withValues(alpha: .05),
                          ),
                          child: Text(
                            "-10%",
                            maxLines: 2,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              color: AppTheme.red_color,
                              fontWeight: FontWeight.w500,
                              letterSpacing: .5,
                              fontSize: 12.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    dense: true,
                    minTileHeight: 20,
                    minLeadingWidth: 0,
                    minVerticalPadding: 0,
                    horizontalTitleGap: 0,
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      "${(product.price * ((100 - 10) / 100)).toStringAsFixed(2)} ${AppKeys.app_currency.name.tr}",
                      maxLines: 2,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        color: appTheme.textTheme.displayLarge!.color,
                        fontWeight: FontWeight.w700,
                        letterSpacing: .5,
                        fontSize: 17.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
