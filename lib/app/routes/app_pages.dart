import "package:flutter/material.dart";
import "package:get/get.dart";

import "../modules/initial/bindings/initial_binding.dart";
import "../modules/initial/views/initial_view.dart";
import "../modules/register/bindings/register_binding.dart";
import "../modules/register/views/register_view.dart";
import "../modules/splash/bindings/splash_binding.dart";
import "../modules/splash/views/splash_view.dart";

part "app_routes.dart";

class AppPages {
  AppPages._();

  static const String INITIAL = Routes.SPLASH;

  static final List<GetPage<Widget>> routes = <GetPage<Widget>>[
    GetPage<Widget>(
      name: Routes.PLACEHOLDER,
      page: () => const Placeholder(),
    ),
    GetPage<Widget>(
      name: Routes.SPLASH,
      binding: SplashBinding(),
      page: () => const SplashView(),
    ),
    GetPage<Widget>(
      name: Routes.REGISTER,
      binding: RegisterBinding(),
      page: () => const RegisterView(),
    ),
    GetPage<Widget>(
      name: _Paths.INITIAL,
      binding: InitialBinding(),
      page: () => const InitialView(),
    ),
  ];
}
