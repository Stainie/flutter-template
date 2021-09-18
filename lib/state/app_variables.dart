import 'package:flutter/material.dart';

enum APP_VARS_KEYS { TEST, DEVICE_LOCALE, PREFERRED_LOCALE, ROUTE_OBSERVER }

Map<APP_VARS_KEYS, dynamic> initialVariables = {
  APP_VARS_KEYS.DEVICE_LOCALE: Locale('en', 'US'),
  APP_VARS_KEYS.PREFERRED_LOCALE: Locale('en', 'US')
};

class AppVariables {
  Map<APP_VARS_KEYS, dynamic> vars;

  AppVariables({
    required this.vars,
  });
}
