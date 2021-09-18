import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_template/services/core/app_state_service.dart';
import 'package:flutter_template/services/core/localize.dart';
import 'package:flutter_template/services/user_prefs.dart';
import 'package:flutter_template/state/app_state_constants.dart';
import 'package:flutter_template/state/app_variables.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/app.router.dart';
import 'app/locator.dart';

void main() {
  setUpLocator();

  // Init AppStateService
  AppStateService appStateService = locator<AppStateService>();
  RouteObserver<PageRoute> routeObserver =
      appStateService.getAppVars().vars[APP_VARS_KEYS.ROUTE_OBSERVER];

  String preferredLanguage = locator<UserPrefs>().preferredLanguage;

  runApp(MaterialApp(
    title: 'Flutter Template',
    theme: ThemeData(),
    onGenerateRoute: StackedRouter().onGenerateRoute,
    initialRoute: Routes.userView,
    navigatorKey: StackedService.navigatorKey,
    navigatorObservers: [routeObserver],
    supportedLocales: supportedLangsNames.values,
    localizationsDelegates: [
      LocalizeDelegate(supportedLangsNames.values.toList()),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate
    ],
    localeResolutionCallback:
        (Locale? locale, Iterable<Locale> supportedLocales) {
      appStateService.setAppVar(APP_VARS_KEYS.DEVICE_LOCALE, locale);

      locale = (supportedLangsNames[preferredLanguage] != null
          ? supportedLangsNames[preferredLanguage]
          : locale);
      if (locale != null) {
        for (Locale supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode) {
            appStateService.setAppVar(
                APP_VARS_KEYS.PREFERRED_LOCALE, supportedLocale);

            return supportedLocale;
          }
        }
      }
      appStateService.setAppVar(APP_VARS_KEYS.PREFERRED_LOCALE, DEFAULT_LOCALE);

      return DEFAULT_LOCALE;
    },
  ));
}
