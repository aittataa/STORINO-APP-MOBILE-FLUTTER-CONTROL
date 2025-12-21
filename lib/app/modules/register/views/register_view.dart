import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";
import "package:storino/app/shared/outline_button.dart";

import "../../../config/constants/app_constant.dart";
import "../../../config/functions/app_function.dart";
import "../../../config/messages/app_message.dart";
import "../../../config/themes/app_theme.dart";
import "../../../config/translations/app_translation.dart";
import "../../../shared/edit_text.dart";
import "../../../shared/load_bar.dart";
import "../../../shared/progress_bar.dart";
import "../../../shared/scrolled_bar.dart";
import "../controllers/register_controller.dart";

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    /// TODO : Page Controller
    Get.lazyPut<RegisterController>(() => RegisterController());

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
            extendBody: true,
            extendBodyBehindAppBar: true,
            backgroundColor: appTheme.colorScheme.onSurface,
            body: const _Body(),
          ),
        );
      }),
    );
  }
}

class _Body extends GetView<RegisterController> {
  const _Body();

  @override
  Widget build(BuildContext context) {
    /// TODO : App Theme
    final ThemeData appTheme = Theme.of(context);

    /// TODO : isTablet
    final bool isTablet = context.isTablet;
    final double screenHeight = isTablet ? AppConstant.screenHeight : AppConstant.screenHeight;
    final double screenWidth = isTablet ? AppConstant.screenTablet : AppConstant.screenWidth;
    final double width = screenWidth * .5;
    final double height = screenWidth * .5;
    final double boxSize = isTablet ? 60 : 52.5;
    final double iconSize = isTablet ? 30 : 27.5;

    ///
    return ScrolledBar(
      controller: controller.scrollController_1,
      child: SingleChildScrollView(
        controller: controller.scrollController_1,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: SafeArea(
          child: Column(
            spacing: 40,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                width: width,
                height: height,
                child: SvgPicture.asset(
                  AppMessage.asset_app_icon,
                  color: AppTheme.main_color_1,
                  width: width,
                  height: height,
                ),
              ),

              ListTile(
                dense: true,
                minTileHeight: 0,
                minLeadingWidth: 0,
                minVerticalPadding: 0,
                horizontalTitleGap: 0,
                contentPadding: EdgeInsets.zero,
                title: Row(
                  spacing: 5,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      AppKeys.labelWelcome.name.tr,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: appTheme.textTheme.displayLarge!.color!,
                        fontWeight: FontWeight.w600,
                        letterSpacing: .5,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      AppKeys.app_title.name.tr,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: appTheme.textTheme.displayLarge!.color!,
                        fontWeight: FontWeight.w900,
                        letterSpacing: .5,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Text(
                    AppKeys.labelWelcomeDesc.name.tr,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: appTheme.textTheme.displayLarge!.color!.withValues(alpha: .5),
                      fontWeight: FontWeight.w500,
                      letterSpacing: .5,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),

              Form(
                key: controller.formKey_1,
                child: Column(
                  spacing: 15,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    EditText(
                      controller: controller.nameController,
                      labelText: AppKeys.labelFullNameLabel.name.tr,
                      hintText: AppKeys.labelFullNameHint.name.tr,
                      keyboardType: TextInputType.text,
                      textColor: appTheme.textTheme.displayLarge!.color!,
                      fillColor: appTheme.colorScheme.onSurface,
                      borderColor: AppTheme.main_color_1,
                      textCapitalization: TextCapitalization.words,
                      textInputAction: TextInputAction.next,
                      obscureText: false,
                      maxLines: 1,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return " * ${AppKeys.labelFieldRequired.name.tr}";
                        }
                        return null;
                      },
                    ),
                    EditText(
                      controller: controller.emailController,
                      labelText: AppKeys.labelEmailLabel.name.tr,
                      hintText: AppKeys.labelEmailHint.name.tr,
                      keyboardType: TextInputType.emailAddress,
                      textColor: appTheme.textTheme.displayLarge!.color!,
                      fillColor: appTheme.colorScheme.onSurface,
                      borderColor: AppTheme.main_color_1,
                      textCapitalization: TextCapitalization.none,
                      textInputAction: TextInputAction.next,
                      obscureText: false,
                      maxLines: 1,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return " * ${AppKeys.labelFieldRequired.name.tr}";
                        }
                        return null;
                      },
                    ),
                    EditText(
                      controller: controller.phoneController,
                      labelText: AppKeys.labelPhoneNumberLabel.name.tr,
                      hintText: AppKeys.labelPhoneNumberHint.name.tr,
                      keyboardType: TextInputType.number,
                      textColor: appTheme.textTheme.displayLarge!.color!,
                      fillColor: appTheme.colorScheme.onSurface,
                      borderColor: AppTheme.main_color_1,
                      textCapitalization: TextCapitalization.none,
                      textInputAction: TextInputAction.next,
                      obscureText: false,
                      maxLines: 1,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10),
                        FilteringTextInputFormatter.allow(RegExp(r"[0-9]")),
                      ],
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return " * ${AppKeys.labelFieldRequired.name.tr}";
                        }
                        if (!AppFunction.isValidPhone(value)) {
                          return " * ${AppKeys.labelInvalidPhoneNumber.name.tr}";
                        }
                        return null;
                      },
                    ),
                    Obx(() {
                      final bool obscureText = controller.obscureText.value;
                      final Color color = obscureText ? AppTheme.icon_color_3 : AppTheme.main_color_1;
                      return EditText(
                        controller: controller.passwordController,
                        labelText: AppKeys.labelPasswordLabel.name.tr,
                        hintText: AppKeys.labelPasswordHint.name.tr,
                        keyboardType: TextInputType.emailAddress,
                        textColor: appTheme.textTheme.displayLarge!.color!,
                        fillColor: appTheme.colorScheme.onSurface,
                        borderColor: AppTheme.main_color_1,
                        textCapitalization: TextCapitalization.none,
                        textInputAction: TextInputAction.done,
                        obscureText: obscureText,
                        maxLines: 1,
                        trailing: GestureDetector(
                          onTap: () => controller.anObscureText(),
                          child: SizedBox(
                            width: boxSize,
                            height: boxSize,
                            child: Center(
                              child: SvgPicture.asset(
                                AppMessage.asset_icon_eye,
                                color: color,
                                width: iconSize,
                                height: iconSize,
                              ),
                            ),
                          ),
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return " * ${AppKeys.labelFieldRequired.name.tr}";
                          }
                          return null;
                        },
                      );
                    }),
                    OutlineButton(
                      label: AppKeys.labelRegister.name.tr,
                      onPressed: controller.goToVerificationView,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
