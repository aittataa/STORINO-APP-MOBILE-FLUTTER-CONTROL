import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";
import "package:pinput/pinput.dart";

import "../config/constants/app_constant.dart";
import "../config/messages/app_message.dart";
import "../config/themes/app_theme.dart";

class EditText extends StatelessWidget {
  final TextEditingController? controller;
  final Widget? leading;
  final String hintText;
  final String labelText;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final List<TextInputFormatter> inputFormatters;
  final TextDirection? textDirection;
  final TextCapitalization textCapitalization;
  final bool autofocus;
  final bool readOnly;
  final bool expands;
  final int? minLines;
  final int? maxLines;
  final Color fillColor;
  final Color textColor;
  final Color borderColor;
  final double radius;
  final Widget? trailing;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;

  const EditText({
    super.key,
    this.controller,
    this.leading,
    required this.hintText,
    required this.labelText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.inputFormatters = const <TextInputFormatter>[],
    this.textDirection,
    this.textCapitalization = TextCapitalization.sentences,
    this.autofocus = false,
    this.readOnly = false,
    this.expands = false,
    this.minLines,
    this.maxLines,
    this.fillColor = AppTheme.transparent_color,
    required this.textColor,
    this.borderColor = AppTheme.transparent_color,
    this.radius = AppConstant.defaultRadius,
    this.trailing,
    this.validator,
    this.onTap,
    this.onChanged,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    /// TODO : App Theme
    final ThemeData appTheme = Theme.of(context);

    /// TODO : isTablet
    final bool isTablet = context.isTablet;
    final double labelFontSize = isTablet ? 17.5 : 17.5;
    final double hintFontSize = isTablet ? 15 : 15;
    final double inputFontSize = isTablet ? 17.5 : 17.5;
    final double errorFontSize = isTablet ? 15 : 15;

    ///
    return TextFormField(
      onTap: onTap,
      validator: validator,
      onChanged: onChanged,
      controller: controller,
      onFieldSubmitted: onFieldSubmitted,
      style: GoogleFonts.poppins(
        color: textColor,
        fontWeight: FontWeight.w600,
        letterSpacing: .5,
        fontSize: inputFontSize,
      ),
      enableInteractiveSelection: false,
      contextMenuBuilder: (_, __) => const SizedBox.shrink(),
      toolbarOptions: const ToolbarOptions(
        copy: false,
        paste: false,
        cut: false,
        selectAll: false,
      ),
      textDirection: textDirection,
      scrollPadding: EdgeInsets.zero,
      cursorColor: AppTheme.main_color_1,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      obscureText: obscureText,
      obscuringCharacter: AppMessage.obscuring_character,
      autofocus: autofocus,
      readOnly: readOnly,
      expands: expands,
      minLines: minLines,
      maxLines: maxLines,
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.center,
      textCapitalization: textCapitalization,
      decoration: InputDecoration(
        prefixIcon: leading,
        suffixIcon: trailing,
        border: inputBorder(radius, borderColor),
        focusedBorder: inputBorder(radius, AppTheme.main_color_1),
        enabledBorder: inputBorder(radius, borderColor),
        disabledBorder: inputBorder(radius, borderColor),
        focusedErrorBorder: inputBorder(radius, borderColor),
        errorBorder: inputBorder(radius, borderColor),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        filled: true,
        fillColor: fillColor,
        hintText: hintText,
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintStyle: GoogleFonts.poppins(
          color: textColor.withValues(alpha: .5),
          fontWeight: FontWeight.w500,
          letterSpacing: .5,
          fontSize: hintFontSize,
        ),
        labelStyle: GoogleFonts.poppins(
          color: AppTheme.main_color_1,
          fontWeight: FontWeight.w500,
          letterSpacing: .5,
          fontSize: labelFontSize,
        ),
        errorStyle: GoogleFonts.poppins(
          color: AppTheme.red_color,
          fontWeight: FontWeight.w500,
          letterSpacing: .5,
          fontSize: errorFontSize,
        ),
      ),
    );
  }
}

OutlineInputBorder inputBorder(double radius, [Color borderColor = AppTheme.transparent_color]) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(radius)),
    borderSide: BorderSide(color: borderColor, width: 1.5),
  );
}

PinTheme pinTheme(Color font, Color front, Color border) => PinTheme(
  width: 60,
  height: 60,
  padding: EdgeInsets.zero,
  margin: EdgeInsets.zero,
  textStyle: GoogleFonts.poppins(
    color: font,
    fontWeight: FontWeight.w600,
    letterSpacing: .5,
    fontSize: 15,
  ),
  decoration: BoxDecoration(
    color: front,
    borderRadius: AppConstant.radiusAll,
    border: Border.all(color: border, width: 2),
  ),
);
