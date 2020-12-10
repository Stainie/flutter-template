import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  Locale locale;

  AppLocalizations(Locale locale) {
    this.locale = locale;
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  Map<String, dynamic> jsonMap;

  Future load() async {
    String jsonString =
        await rootBundle.loadString("lang/${locale.languageCode}.json");

    jsonMap = jsonDecode(jsonString);
  }

  String translateString(String key) {
    return jsonMap[key].toString();
  }

  List<String> translateList(String key) {
    List list = jsonMap[key];
    List<String> listString = List();

    for (var i = 0; i < list.length; i++) {
      listString.add(list[i]);
    }

    return listString;
  }

  Map<dynamic, dynamic> translateMap(String key) {
    Map<dynamic, dynamic> map = Map();

    map = jsonMap[key].map((k, value) {
      return MapEntry(k.toString(), value.toString());
    });

    return map;
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    // list all the language codes below
    return ['en'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}
