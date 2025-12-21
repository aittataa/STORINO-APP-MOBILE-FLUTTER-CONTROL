part of "app_pages.dart";

abstract class Routes {
  const Routes._();
  static const String PLACEHOLDER = _Paths.PLACEHOLDER;
  static const String SPLASH = _Paths.SPLASH;
  static const String REGISTER = _Paths.REGISTER;
  static const String INITIAL = _Paths.INITIAL;
  static const String PRODUCTS = _Paths.PRODUCTS;
  static const String DETAILS = _Paths.DETAILS;
  static const String VALIDATIONS = _Paths.VALIDATIONS;
}

abstract class _Paths {
  const _Paths._();
  static const String PLACEHOLDER = "/placeholder";
  static const String SPLASH = "/splash";
  static const String REGISTER = "/register";
  static const String INITIAL = "/initial";
  static const String PRODUCTS = "/products";
  static const String DETAILS = "/details";
  static const String VALIDATIONS = "/validations";
}
