import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'domain/core/const.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'SIGN_WITH_GOOGLE': 'Sign in with google',
    },
    'pl': {
      'SIGN_WITH_GOOGLE': 'Zaloguj sie z google',
    },
  };

  String get GOOGLE_LOGIN {
    return _localizedValues[locale.languageCode]['GOOGLE_LOGIN'];
  }

  String get(String key) {
    if (_localizedValues[locale.languageCode][key] == null) {
      return key;
    }
    return _localizedValues[locale.languageCode][key];
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      [LANG_PL, LANG_EN].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
