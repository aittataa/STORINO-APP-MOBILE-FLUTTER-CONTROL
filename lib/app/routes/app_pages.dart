import "package:flutter/material.dart";

import "package:get/get.dart";

import "../modules/details/bindings/details_binding.dart";
import "../modules/details/views/details_view.dart";
import "../modules/initial/bindings/initial_binding.dart";
import "../modules/initial/views/initial_view.dart";
import "../modules/products/bindings/products_binding.dart";
import "../modules/products/views/products_view.dart";
import "../modules/register/bindings/register_binding.dart";
import "../modules/register/views/register_view.dart";
import "../modules/splash/bindings/splash_binding.dart";
import "../modules/splash/views/splash_view.dart";
import "../modules/validations/bindings/validations_binding.dart";
import "../modules/validations/views/validations_view.dart";

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
    GetPage(
      name: _Paths.INITIAL,
      page: () => const InitialView(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCTS,
      page: () => const ProductsView(),
      binding: ProductsBinding(),
    ),
    GetPage(
      name: _Paths.DETAILS,
      page: () => const DetailsView(),
      binding: DetailsBinding(),
    ),
    GetPage(
      name: _Paths.VALIDATIONS,
      page: () => const ValidationsView(),
      binding: ValidationsBinding(),
    ),
  ];
}
