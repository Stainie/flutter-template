import 'package:observable_ish/observable_ish.dart';
import 'package:flutter_template/app/locator.dart';
import 'package:flutter_template/models/root_model.dart';
import 'package:flutter_template/services/core/app_state_service.dart';

import '../state/app_state.dart';

// TODO: using RootModel until we learn a way to have list of potential extends ?

class BaseService<T extends RootModel> {
  RxValue<T> _rxModel;
  RxValue<AppState> _rxAppState;

  AppStateService appStateService = locator<AppStateService>();

  initialiseRxAppState() {
    this._rxAppState =
        RxValue<AppState>(initial: appStateService.getAppState());
    appStateService.addListener(_appStateChange);
  }

  _appStateChange() {
    this._rxAppState.value = appStateService.getAppState();
  }

  getRxAppState() {
    return this._rxAppState;
  }

  getAppState() {
    return this._rxAppState.value;
  }

  initialiseRxModel(T value) {
    this._rxModel = RxValue<T>(initial: value);
  }

  RxValue<T> getRxModel() {
    return this._rxModel;
  }

  setRxModelValue(value) {
    this._rxModel.value = value;
  }

  T getRxModelValue() {
    return this._rxModel.value;
  }
}
