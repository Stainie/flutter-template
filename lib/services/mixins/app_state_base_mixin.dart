import 'package:flutter_template/app/locator.dart';
import 'package:flutter_template/services/core/app_state_service.dart';
import 'package:flutter_template/state/app_state.dart';
import 'package:observable_ish/observable_ish.dart';

mixin AppStateServiceBaseMixin {
  RxValue<AppState>? _rxAppState;
  AppStateService appStateService = locator<AppStateService>();

  initialiseRxAppState() {
    this._rxAppState = RxValue<AppState>(appStateService.getAppState());
    appStateService.addListener(_appStateChange);
  }

  _appStateChange() {
    this._rxAppState?.value = appStateService.getAppState();
  }

  getRxAppState() {
    return this._rxAppState;
  }

  getAppState() {
    return this._rxAppState?.value;
  }
}
