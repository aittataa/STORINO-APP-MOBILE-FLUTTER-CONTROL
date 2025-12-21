import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:get/get.dart";
import "package:intl/intl.dart";
import "package:url_launcher/url_launcher.dart";

import "../enums/app_enum.dart";
import "../themes/app_theme.dart";

class AppFunction {
  AppFunction._();

  /// TODO : App Language
  static String app_language_code = kDebugMode ? AppLanguages.fr.name : AppLanguages.fr.name;
  static final String _language_code = AppEnum.languages_code[app_language_code]!;

  static bool get isRightToLeft {
    final bool response = app_language_code == AppLanguages.ar.name;
    return response;
  }

  static String formatPhoneNumber(String input) {
    if (input.startsWith("0")) {
      return "+212${input.substring(1)}";
    }
    return "+$input";
  }

  static bool isValidPhone(String phone) {
    final RegExp regex = RegExp(r"^0[678]\d{8}$");
    final String cleaned = phone.replaceAll(RegExp(r"\D"), "");
    return regex.hasMatch(cleaned);
  }

  static const String _standardDateFormat = "dd MMM yyyy";

  static String dateFormat(DateTime date, [String pattern = _standardDateFormat]) => DateFormat(pattern, _language_code).format(date.toLocal());

  static Future<void> launchURL(String path) async {
    final Uri uri = Uri.parse(path);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw Exception("Couldn't Launch $path");
    }
  }

  static BoxShadow boxShadow([Color color = AppTheme.transparent_color]) {
    return BoxShadow(color: color, blurRadius: 5, spreadRadius: .01);
  }

  static SliverGridDelegateWithFixedCrossAxisCount gridDelegate({int crossAxisCount = 1, double spacing = 10, double childAspectRatio = 1}) {
    return SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: crossAxisCount, childAspectRatio: childAspectRatio, mainAxisSpacing: spacing, crossAxisSpacing: spacing);
  }

  /*static SnackBar snackBar({required String label, Color color = AppTheme.red_color}) {
    return SnackBar(
      content: Text(
        label,
        textAlign: TextAlign.center,
        style: const TextStyle(color: AppTheme.text_color_2, fontWeight: FontWeight.bold, letterSpacing: .5),
      ),
      elevation: 0,
      backgroundColor: color,
      padding: const EdgeInsets.all(10),
      width: AppConstant.screenWidth * .75,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
      showCloseIcon: false,
      closeIconColor: color,
      duration: 2500.milliseconds,
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.down,
    );
  }*/

  /*static AuthException authException(FirebaseException e) {
    log("code : ${e.code}");
    log("message : ${e.message}");
    final AuthException authException = AuthException(code: e.code.toString(), message: e.message.toString(), title: AppKeys.app_title.name.tr, subtitle: AppKeys.labelSomethingWrong.name.tr);
    switch (e.code) {
      case "resource-exhausted":
        authException.title = AppKeys.app_title.name.tr;
        authException.subtitle = AppKeys.labelTooManyRequests.name.tr;
        return authException;
      case "invalid-credential":
        authException.title = AppKeys.app_title.name.tr;
        authException.subtitle = AppKeys.labelInvalidLoginCredentials.name.tr;
        return authException;
      case "INVALID_LOGIN_CREDENTIALS":
        authException.title = AppKeys.app_title.name.tr;
        authException.subtitle = AppKeys.labelUnauthorized.name.tr;
        return authException;
      case "unauthorized":
        authException.title = AppKeys.app_title.name.tr;
        authException.subtitle = AppKeys.labelUnauthorized.name.tr;
        return authException;
      case "user-not-found":
        authException.title = AppKeys.app_title.name.tr;
        authException.subtitle = AppKeys.labelUserNotFound.name.tr;
        return authException;
      case "wrong-password":
        authException.title = AppKeys.app_title.name.tr;
        authException.subtitle = AppKeys.labelWrongPassword.name.tr;
        return authException;
      case "invalid-password":
        authException.title = AppKeys.app_title.name.tr;
        authException.subtitle = AppKeys.labelInvalidPassword.name.tr;
        return authException;
      case "too-many-requests":
        authException.title = AppKeys.app_title.name.tr;
        authException.subtitle = AppKeys.labelTooManyRequests.name.tr;
        return authException;
      case "network-request-failed":
        authException.title = AppKeys.app_title.name.tr;
        authException.subtitle = AppKeys.labelNetworkRequestFailed.name.tr;
        return authException;
      case "weak-password":
        authException.title = AppKeys.app_title.name.tr;
        authException.subtitle = AppKeys.labelWeakPassword.name.tr;
        return authException;
      case "email-already-in-use":
        authException.title = AppKeys.app_title.name.tr;
        authException.subtitle = AppKeys.labelEmailAlreadyUsed.name.tr;
        return authException;
      case "invalid-email":
        authException.title = AppKeys.app_title.name.tr;
        authException.subtitle = AppKeys.labelInvalidEmail.name.tr;
        return authException;
      default:
        authException.title = AppKeys.app_title.name.tr;
        authException.subtitle = AppKeys.labelSomethingWrong.name.tr;
        return authException;
    }
  }*/

  static void get configureDependencies {
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppTheme.transparent_color,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: AppTheme.main_color_1,
        systemNavigationBarDividerColor: AppTheme.main_color_1,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }

  static SystemUiOverlayStyle systemUiOverlayStyle(Color color, {Brightness? mode, bool isDarkMode = false}) {
    if (isDarkMode) {
      final Brightness brightness = GetPlatform.isAndroid ? Brightness.light : Brightness.dark;
      return SystemUiOverlayStyle.dark.copyWith(
        systemNavigationBarColor: color,
        systemNavigationBarDividerColor: color,
        statusBarColor: AppTheme.transparent_color,
        statusBarBrightness: brightness,
        statusBarIconBrightness: brightness,
        systemNavigationBarIconBrightness: brightness,
      );
    } else {
      final Brightness brightness = GetPlatform.isAndroid ? Brightness.dark : Brightness.light;
      return SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarColor: color,
        systemNavigationBarDividerColor: color,
        statusBarColor: AppTheme.transparent_color,
        statusBarBrightness: brightness,
        statusBarIconBrightness: brightness,
        systemNavigationBarIconBrightness: brightness,
      );
    }
  }
}
