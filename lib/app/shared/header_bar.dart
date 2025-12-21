import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";

import "../config/constants/app_constant.dart";
import "../config/themes/app_theme.dart";

class HeaderBar extends StatelessWidget implements PreferredSizeWidget {
  final double toolbarHeight;
  final double radius;
  final Color color;
  final Color borderColor;
  final Widget leading;
  final Widget title;
  final Widget trailing;

  const HeaderBar({
    super.key,
    this.toolbarHeight = kToolbarHeight,
    this.radius = AppConstant.defaultRadius,
    this.color = AppTheme.transparent_color,
    this.borderColor = AppTheme.transparent_color,
    this.leading = const Visibility.maintain(visible: false, child: HeadIcon()),
    this.title = const SizedBox.shrink(),
    this.trailing = const Visibility.maintain(visible: false, child: HeadIcon()),
  });

  @override
  Widget build(BuildContext context) {
    /// TODO : App Theme
    final ThemeData appTheme = Theme.of(context);

    /// TODO : isTablet
    final bool isTablet = context.isTablet;
    final double padding = isTablet ? 15 : 10;
    final BorderRadius borderRadius = BorderRadius.vertical(bottom: Radius.circular(radius));

    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
        border: Border(bottom: BorderSide(color: borderColor, width: 1.5)),
      ),
      child: AppBar(
        elevation: 0,
        leadingWidth: 0,
        titleSpacing: 0,
        scrolledUnderElevation: 0,
        toolbarHeight: toolbarHeight,
        backgroundColor: color,
        shadowColor: color,
        surfaceTintColor: color,
        centerTitle: true,
        excludeHeaderSemantics: true,
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        leading: null,
        title: Builder(
          builder: (_) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: padding,
                vertical: padding,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  leading,
                  Expanded(child: Center(child: title)),
                  trailing,
                ],
              ),
            );
          },
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}

class HeadIcon extends StatelessWidget {
  final String? asset;
  final IconData? icon;
  final double size;
  final Widget child;
  final Color color;
  final Color borderColor;
  final Color backgroundColor;
  final void Function()? onTap;

  const HeadIcon({
    super.key,
    this.asset,
    this.icon,
    this.size = 25,
    this.child = const SizedBox.shrink(),
    this.color = AppTheme.transparent_color,
    this.borderColor = AppTheme.transparent_color,
    this.backgroundColor = AppTheme.transparent_color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    ///  TODO : App Theme
    final ThemeData appTheme = Theme.of(context);

    /// TODO : isTablet
    final bool isTablet = context.isTablet;
    final double padding = isTablet ? 15 : 12.5;
    final double radius = isTablet ? 15 : 12.5;

    ///
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          border: Border.all(color: borderColor, width: 1.5),
        ),
        child: Builder(
          builder: (_) {
            if (asset != null) {
              return SvgPicture.asset(
                asset.toString(),
                color: color,
                width: size,
                height: size,
              );
            } else if (icon != null) {
              return Icon(
                icon,
                color: color,
                size: size,
              );
            }
            return child;
          },
        ),
      ),
    );
  }
}

class HeadTitle extends StatelessWidget {
  final String title;
  final Color? color;
  final double? fontSize;

  const HeadTitle({
    super.key,
    required this.title,
    this.color,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    /// TODO : App Theme
    final ThemeData appTheme = Theme.of(context);

    /// TODO : isTablet
    final bool isTablet = context.isTablet;
    final double fontSize__ = isTablet ? 20 : 15;
    final double fontSize_ = fontSize == null ? fontSize__ : fontSize!;
    //
    final Color fontColor = color == null ? appTheme.textTheme.displayLarge!.color! : color!;

    return Text(
      title,
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.poppins(
        color: fontColor,
        fontWeight: FontWeight.bold,
        letterSpacing: .5,
        fontSize: fontSize_,
      ),
    );
  }
}
