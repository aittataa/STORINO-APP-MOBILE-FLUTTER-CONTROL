import "package:get/get.dart";

import "../enums/app_enum.dart";
import "language_ar.dart";
import "language_en.dart";
import "language_fr.dart";

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys {
    return <String, Map<String, String>>{
      AppLanguages.en.name: language_en,
      AppLanguages.ar.name: language_ar,
      AppLanguages.fr.name: language_fr,
    };
  }
}

enum AppKeys {
  app_title,
  app_currency,

  ///
  labelFieldRequired,
  labelSomethingWrong,
  labelInvalidPhoneNumber,
  labelOk,
  labelYes,
  labelNo,
  labelNext,
  labelWelcome,
  labelWelcomeDesc,
  labelPhoneNumberHint,
  labelPhoneNumberLabel,
  labelVerificationCode,
  labelVerificationCodeDesc,
  labelSuccess,
  labelSuccessDesc,
  labelRedirection,
  labelSecondes,
  labelWelcoming,
  labelFeatured,
  labelBestSelling,
  labelSeeAll,
  labelRecentProducts,
  labelSizes,
  labelQuantity,
  labelFullNameLabel,
  labelFullNameHint,
  labelEmailLabel,
  labelEmailHint,
  labelPasswordLabel,
  labelPasswordHint,
  labelRegister,
  labelVerify,
}
