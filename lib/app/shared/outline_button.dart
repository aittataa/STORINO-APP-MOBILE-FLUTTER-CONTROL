import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

import "../config/constants/app_constant.dart";
import "../config/themes/app_theme.dart";

class OutlineButton extends StatelessWidget {
  final double fontSize;
  final Color? textColor;
  final Color? backColor;
  final Color borderColor;
  final double radius;
  final String label;
  final Widget? child;
  final void Function()? onPressed;

  const OutlineButton({
    super.key,
    this.fontSize = 15,
    this.textColor = AppTheme.text_color_2,
    this.backColor = AppTheme.main_color_1,
    this.borderColor = AppTheme.transparent_color,
    this.radius = AppConstant.defaultRadius,
    required this.label,
    this.child,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        elevation: 0,
        foregroundColor: backColor,
        backgroundColor: backColor,
        disabledForegroundColor: backColor,
        shadowColor: backColor,
        surfaceTintColor: backColor,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
        ),
        minimumSize: const Size(double.infinity, 50),
        side: BorderSide(color: borderColor, width: 1.5),
      ),
      child: Builder(builder: (_) {
        if (!(child == null)) return child!;
        return Text(
          label,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.poppins(
            color: textColor,
            fontWeight: FontWeight.bold,
            letterSpacing: .5,
            fontSize: fontSize,
          ),
        );
      }),
    );
  }
}
