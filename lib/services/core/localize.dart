import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/app/locator.dart';
import 'package:flutter_template/services/user_prefs.dart';
import 'package:flutter_template/state/app_state_constants.dart';

class Localize {
  Localize(this.locale, this.fallbackLang);
  UserPrefs userPrefs = locator<UserPrefs>();

  Locale? locale;
  final Locale? fallbackLang;

  static Localize of(BuildContext? context, {bool mock = false}) {
    if (context != null) {
      if (!mock && Localizations.of<Localize>(context, Localize) != null) {
        return Localizations.of<Localize>(context, Localize)!;
      } else {
        Locale locale = new Locale('en', 'US');
        return Localize(locale, locale);
      }
    } else
      throw Exception(
          "Cannot use localize without giving proper context. (Localize.of was called with [context] == null)");
  }

  Map<String, String>? _sentences;
  Map<String, String>? _fallBackSentences;

  //use to load local en.json to test changes in localization
  bool loadLocalfile = false;

  Future<void> loadFromCache(Locale? newLocale) async {
    Locale? currentLocale = (newLocale != null ? newLocale : this.locale);
    locale = currentLocale;

    Map<String, dynamic>? _result = locale == supportedLangsNames["English"] &&
            loadLocalfile &&
            !kReleaseMode
        ? await loadEnglishLocale(currentLocale)
        : await userPrefs.getLanguageWords();

    this._sentences = Map();
    _result?.forEach((String key, dynamic value) {
      this._sentences?[key] = value.toString();
    });

    String dataFallback = await rootBundle.loadString('assets/lang/en.json');
    Map<String, dynamic> _resultFallback = json.decode(dataFallback);

    this._fallBackSentences = Map();
    _resultFallback.forEach((String key, dynamic value) {
      this._fallBackSentences?[key] = value.toString();
    });
  }

  Future<Map<String, dynamic>> loadEnglishLocale(Locale? currentLocale) async {
    String filedata;

    try {
      filedata = await rootBundle
          .loadString('assets/lang/${currentLocale?.languageCode}.json');
    } catch (s) {
      print(s);
      filedata = await rootBundle
          .loadString('assets/lang/${this.fallbackLang?.languageCode}.json');
    }
    return json.decode(filedata);
  }

  String trans(String? key) {
    if (key != null) {
      return (this._sentences?[key] != null
          ? (this._sentences![key]!.isNotEmpty
              ? this._sentences![key]!
              : this._fallBackSentences![key]!)
          : this._fallBackSentences?[key] != null
              ? this._fallBackSentences![key]!
              : "");
    } else {
      return "";
    }
  }

  Map<String, String>? getSentences() {
    return _sentences;
  }

  Map<String, String>? getFallbackSentences() {
    return _fallBackSentences;
  }
}

class LocalizeDelegate extends LocalizationsDelegate<Localize> {
  const LocalizeDelegate(this.supportedLangs);
  final List<Locale> supportedLangs;

  @override
  bool isSupported(Locale locale) => supportedLangs.contains(locale);

  @override
  Future<Localize> load(Locale locale) async {
    Localize? localizations = Localize(locale, Locale("en", "US"));

    await localizations.loadFromCache(locale);
    print("Load ${locale.languageCode} from cache");
    return localizations;
  }

  @override
  bool shouldReload(LocalizeDelegate old) => false;
}
