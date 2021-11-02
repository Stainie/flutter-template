import 'package:flutter_template/state/app_state.dart';
import 'package:flutter_template/state/app_state_constants.dart';
import 'package:flutter_template/state/app_variables.dart';
import 'package:flutter_template/state/initial_state.dart';
import 'package:stacked/stacked.dart';

class AppStateService with ReactiveServiceMixin {
  AppStateService() {
    listenToReactiveValues([rxAppState]);
  }

  ReactiveValue<AppState> rxAppState = ReactiveValue<AppState>(
    AppState(state: initialState),
  );

  AppState getAppState() {
    return this.rxAppState.value;
  }

  void setState(Map<APP_STATE_KEYS, dynamic> mutation) {
    AppState newState = rxAppState.value.clone();
    mutation.forEach((key, value) {
      newState.state[key] = value;
    });
    rxAppState.value = newState;
  }

  /// Initializes an [AppVariables] object
  AppVariables appVars = AppVariables(vars: initialVariables);

  /// Returns an [AppVariables] object that contains a vars Map
  AppVariables getAppVars() {
    return this.appVars;
  }

  /// Sets an individual variable using the key
  void setAppVar(APP_VARS_KEYS key, dynamic value) {
    appVars.vars[key] = value;
  }

  /// Sets all variables within a map
  void setAppVars(Map<APP_VARS_KEYS, dynamic> varsMap) {
    varsMap.forEach((key, value) {
      setAppVar(key, value);
    });
  }

  void addAppVarsMapValues(APP_VARS_KEYS key, dynamic addMap) {
    dynamic map = appVars.vars[key];
    if (map is Map) {
      map.addAll(addMap);
    } else {
      throw Exception(
          'AppStateService: Cannot add map values to an object that is not a map');
    }
  }
}
