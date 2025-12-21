import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_localizations/flutter_localizations.dart";
import "package:get/get.dart";

import "app/config/constants/app_constant.dart";
import "app/config/enums/app_enum.dart";
import "app/config/functions/app_function.dart";
import "app/config/messages/app_message.dart";
import "app/config/themes/app_theme.dart";
import "app/config/translations/app_translation.dart";
import "app/routes/app_pages.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// TODO : Run App
  return runApp(const STORINO());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class STORINO extends StatelessWidget {
  const STORINO({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => WidgetsBinding.instance.focusManager.primaryFocus?.unfocus(),
      child: GetMaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: kDebugMode,
        title: AppMessage.app_title,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: ThemeMode.system,
        smartManagement: SmartManagement.full,
        scrollBehavior: const ScrolledBehavior(),
        defaultTransition: AppConstant.default_transition,
        transitionDuration: AppConstant.duration_transition,
        translations: AppTranslation(),
        locale: Locale(AppFunction.app_language_code),
        fallbackLocale: Locale(AppFunction.app_language_code),
        supportedLocales: List<Locale>.generate(AppLanguages.values.length, (int i) {
          final String language = AppLanguages.values[i].name;
          final String? country = AppEnum.countries_code[language];
          return Locale(language, country);
        }),
        localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      ),
    );
  }
}

class ScrolledBehavior extends ScrollBehavior {
  const ScrolledBehavior();

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return const ClampingScrollPhysics();
        return const BouncingScrollPhysics();
    }
  }
}
