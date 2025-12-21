enum AppLanguages { en, ar, fr }

class AppEnum {
  AppEnum._();

  static Map<String, String> languages = <String, String>{
    AppLanguages.en.name: "English",
    AppLanguages.ar.name: "العربية",
    AppLanguages.fr.name: "Francais",
  };

  static Map<String, String> languages_code = <String, String>{
    AppLanguages.en.name: "en_US",
    AppLanguages.ar.name: "ar_MA",
    AppLanguages.fr.name: "fr_FR",
  };

  static Map<String, String> countries_code = <String, String>{
    AppLanguages.en.name: "US",
    AppLanguages.ar.name: "MA",
    AppLanguages.fr.name: "FR",
  };
}
