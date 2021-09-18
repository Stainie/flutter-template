import 'package:flutter/material.dart';
import 'app_state_constants.dart';

Map<APP_STATE_KEYS, dynamic> initialState = {
  APP_STATE_KEYS.APP: {'navigatorKey': new GlobalKey<NavigatorState>()},
  APP_STATE_KEYS.CONNECTIVITY: {'didShowDegradedPerformance': false}
};
