import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:shimmer/shimmer.dart";

import "../config/constants/app_constant.dart";
import "../config/functions/app_function.dart";
import "../config/messages/app_message.dart";
import "../config/themes/app_theme.dart";

class ImageView extends StatelessWidget {
  final String imageUrl;
  final bool shadow;
  final Color backColor;
  final Color borderColor;
  final double radius;
  final BoxFit fit;
  final double? width;
  final double? height;
  final Widget? child;

  const ImageView({
    super.key,
    required this.imageUrl,
    this.shadow = false,
    this.backColor = AppTheme.transparent_color,
    this.borderColor = AppTheme.transparent_color,
    this.radius = AppConstant.defaultRadius,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    /// TODO : App Theme
    final ThemeData appTheme = Theme.of(context);
    final Color shadow_color = shadow ? appTheme.colorScheme.shadow.withValues(alpha: .1) : AppTheme.transparent_color;

    /// TODO : isDarkMode
    final bool isDarkMode = context.isDarkMode;
    final String image_placeholder = isDarkMode ? AppMessage.asset_icon_dark : AppMessage.asset_icon_light;

    ///
    return CachedNetworkImage(
      fit: fit,
      width: width,
      height: height,
      imageUrl: imageUrl,
      imageBuilder: (_, ImageProvider<Object> image) {
        return Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: backColor,
            border: Border.all(color: borderColor, width: 1.5),
            borderRadius: BorderRadius.all(Radius.circular(radius)),
            boxShadow: <BoxShadow>[AppFunction.boxShadow(shadow_color)],
            image: DecorationImage(image: image, fit: fit),
          ),
          child: child,
        );
      },
      progressIndicatorBuilder: (_, __, ___) {
        return Shimmer.fromColors(
          baseColor: AppTheme.base_color,
          highlightColor: AppTheme.highlight_color,
          child: Container(
            width: width,
            height: height,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: backColor,
              border: Border.all(color: borderColor, width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(radius)),
              boxShadow: <BoxShadow>[AppFunction.boxShadow(shadow_color)],
            ),
            child: child,
          ),
        );
      },
      errorWidget: (_, __, ___) {
        return Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: backColor,
            border: Border.all(color: borderColor, width: 1.5),
            borderRadius: BorderRadius.all(Radius.circular(radius)),
            boxShadow: <BoxShadow>[AppFunction.boxShadow(shadow_color)],
            image: DecorationImage(image: AssetImage(image_placeholder), fit: fit),
          ),
          child: child,
        );
      },
    );
  }
}

class ProfilePicture extends StatelessWidget {
  final String imageUrl;
  final bool shadow;
  final double? size;
  final Color backColor;
  final Color borderColor;
  final BoxFit fit;
  final Widget? child;

  const ProfilePicture({
    super.key,
    required this.imageUrl,
    this.shadow = false,
    this.size,
    this.backColor = AppTheme.transparent_color,
    this.borderColor = AppTheme.transparent_color,
    this.fit = BoxFit.cover,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    /// TODO : App Theme
    final ThemeData appTheme = Theme.of(context);
    final Color shadow_color = shadow ? appTheme.colorScheme.shadow.withValues(alpha: .1) : AppTheme.transparent_color;

    /// TODO : isDarkMode
    final bool isDarkMode = context.isDarkMode;
    final String image_placeholder = isDarkMode ? AppMessage.asset_icon_dark : AppMessage.asset_icon_light;

    ///
    return CachedNetworkImage(
      fit: fit,
      width: size,
      height: size,
      imageUrl: imageUrl,
      imageBuilder: (_, ImageProvider image) {
        return Container(
          width: size,
          height: size,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: backColor,
            border: Border.all(color: borderColor, width: 1.5),
            borderRadius: null,
            boxShadow: <BoxShadow>[AppFunction.boxShadow(shadow_color)],
            image: DecorationImage(image: image, fit: fit),
          ),
          child: child,
        );
      },
      progressIndicatorBuilder: (_, __, ___) {
        return Shimmer.fromColors(
          baseColor: AppTheme.base_color,
          highlightColor: AppTheme.highlight_color,
          child: Container(
            width: size,
            height: size,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: backColor,
              border: Border.all(color: borderColor, width: 1.5),
              borderRadius: null,
              boxShadow: <BoxShadow>[AppFunction.boxShadow(shadow_color)],
            ),
            child: child,
          ),
        );
      },
      errorWidget: (_, __, ___) {
        return Container(
          width: size,
          height: size,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: backColor,
            border: Border.all(color: borderColor, width: 1.5),
            borderRadius: null,
            boxShadow: <BoxShadow>[AppFunction.boxShadow(shadow_color)],
            image: DecorationImage(image: AssetImage(image_placeholder), fit: fit),
          ),
          child: child,
        );
      },
    );
  }
}
