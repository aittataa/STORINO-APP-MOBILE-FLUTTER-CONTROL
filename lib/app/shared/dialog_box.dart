import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";

import "../config/constants/app_constant.dart";
import "../config/themes/app_theme.dart";

class DialogBox extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<Widget> actions;

  const DialogBox({
    super.key,
    required this.title,
    required this.subtitle,
    this.actions = const <Widget>[],
  });

  @override
  Widget build(BuildContext context) {
    ///  TODO : App Theme
    final ThemeData appTheme = Theme.of(context);

    /// TODO : isTablet
    final bool isTablet = context.isTablet;
    final double screenHeight = isTablet ? AppConstant.screenHeight : AppConstant.screenHeight * .75;
    final double screenWidth = isTablet ? AppConstant.screenTablet * .75 : AppConstant.screenWidth * .75;

    ///
    return AlertDialog(
      iconPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.zero,
      buttonPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.zero,
      backgroundColor: appTheme.colorScheme.onSurface,
      scrollable: true,
      shape: const RoundedRectangleBorder(
        borderRadius: AppConstant.radiusAll,
      ),
      content: Container(
        width: screenWidth,
        decoration: BoxDecoration(
          color: appTheme.colorScheme.onSurface,
          borderRadius: AppConstant.radiusAll,
        ),
        child: Column(
          spacing: 10,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Column(
                spacing: 15,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: AppTheme.main_color_1,
                      fontWeight: FontWeight.bold,
                      letterSpacing: .5,
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: appTheme.textTheme.displayLarge!.color!.withValues(alpha: .75),
                      fontWeight: FontWeight.w500,
                      letterSpacing: .5,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 45,
              width: screenWidth,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(AppConstant.defaultRadius)),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: actions,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final String label;
  final Color color;
  final void Function()? onTap;

  const ActionButton({
    super.key,
    required this.label,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    ///  TODO : App Theme
    final ThemeData appTheme = Theme.of(context);

    /// TODO : isTablet
    final bool isTablet = context.isTablet;
    final double padding = isTablet ? 10 : 10;
    final double fontSize = isTablet ? 17.5 : 15;

    ///
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppTheme.transparent_color,
            borderRadius: BorderRadius.zero,
            border: Border(
              top: BorderSide(color: appTheme.colorScheme.outline.withValues(alpha: .1), width: 1.5),
              left: BorderSide(color: appTheme.colorScheme.outline.withValues(alpha: .1), width: .75),
              right: BorderSide(color: appTheme.colorScheme.outline.withValues(alpha: .1), width: .75),
              bottom: BorderSide(color: appTheme.colorScheme.outline.withValues(alpha: .1), width: .5),
            ),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: color,
              fontSize: 15,
              letterSpacing: .5,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
