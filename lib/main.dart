import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_template/services/auth_service.dart';
import 'package:provider/provider.dart';

import 'app/locator.dart';
import 'app/router.gr.dart' as router;
import 'services/core/app_localizations.dart';

void main() {
  setUpLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Change Stream Provider into MultiProvider if needed
    return StreamProvider(
      create: (context) => locator<AuthenticationService>().userStream.stream,
      child: MaterialApp(
        title: 'Flutter Template',
        theme: ThemeData(),
        onGenerateRoute: router.Router().onGenerateRoute,
        initialRoute: router.Routes.userView,
        supportedLocales: [
          // Add new locales here
          Locale("en", ""),
        ],
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          if (locale == null) {
            print("Locale is null");
            return supportedLocales.first;
          }

          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode) {
              return supportedLocale;
            }
          }

          return supportedLocales.first;
        },
      ),
    );
  }
}
