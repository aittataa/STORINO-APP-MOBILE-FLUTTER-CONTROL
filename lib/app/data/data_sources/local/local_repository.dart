import "dart:developer";

import "package:flutter/material.dart";
import "package:flutter/scheduler.dart";
import "package:get/get.dart";
import "package:injectable/injectable.dart";
import "package:shared_preferences/shared_preferences.dart";

import "../../../config/enums/app_enum.dart";
import "../../../config/functions/app_function.dart";
import "../../../config/themes/app_theme.dart";

@Injectable()
@LazySingleton()
class AppRepository extends GetConnect {
  @override
  void onInit() {
    /// TODO : onInit
    super.onInit();
    log("onInit : AppRepository");
  }

  /// TODO : Language
  final String _app_language = "app_language";

  Future<bool> setLanguage(String value) async {
    final SharedPreferences session = await SharedPreferences.getInstance();
    final bool response = await session.setString(_app_language, value);
    return response;
  }

  Future<String?> getSelectedLanguage() async {
    final SharedPreferences session = await SharedPreferences.getInstance();
    final String? code = session.getString(_app_language);
    if (code == null) return null;
    log("chosen_language : $code");
    return code;
  }

  Future<String> getInitialLanguage() async {
    late String code = Get.deviceLocale!.languageCode;
    log("device_language : $code");
    final List<AppLanguages> value = AppLanguages.values.toList().where((AppLanguages value) => value.name == code).toList();
    if (value.isEmpty) code = AppFunction.app_language_code;
    log("initial_language : $code");
    return code;
  }

  Future<void> get getLanguage async {
    // final String code =  await getSelectedLanguage() ?? await getInitialLanguage();
    final String code = AppFunction.app_language_code;
    final Locale locale = Locale(code);
    AppFunction.app_language_code = code;
    log("app_language : $code");
    return await Get.updateLocale(locale);
  }

  /// TODO : Mode
  final String _app_mode = "app_mode";

  Future<bool> setMode(String value) async {
    final SharedPreferences session = await SharedPreferences.getInstance();
    final bool response = await session.setString(_app_mode, value);
    return response;
  }

  Future<bool> get getMode async {
    final SharedPreferences session = await SharedPreferences.getInstance();
    final String? response = session.getString(_app_mode);
    if (response == null) {
      final Brightness brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
      return brightness.name == ThemeMode.dark.name;
    }
    return response == ThemeMode.dark.name;
  }

  Future<void> get applyMode async {
    final bool response = await getMode;
    if (response) {
      Get.changeTheme(AppTheme.dark);
      Get.changeThemeMode(ThemeMode.dark);
      return log("Selected Mode ${ThemeMode.dark.name}");
    } else {
      Get.changeTheme(AppTheme.light);
      Get.changeThemeMode(ThemeMode.light);
      return log("Selected Mode ${ThemeMode.light.name}");
    }
  }

  /// TODO : App Routes
  final String _app_routes = "app_route";

  Future<bool> setRoutes(String value) async {
    final SharedPreferences session = await SharedPreferences.getInstance();
    final bool response = await session.setString(_app_routes, value);
    return response;
  }

  Future<String?> get getRoutes async {
    final SharedPreferences session = await SharedPreferences.getInstance();
    final String? route = session.getString(_app_routes);
    return route;
  }
}
