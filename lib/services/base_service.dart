// Alex: package not found, triggered compile errors, not needed anyway?
//import 'dart:js_util';

import 'package:observable_ish/observable_ish.dart';
import 'package:flutter_template/app/locator.dart';
import 'package:flutter_template/models/base_model.dart';
import 'package:flutter_template/models/root_model.dart';
import 'package:flutter_template/services/core/app_state_service.dart';

// TODO: using RootModel until we learn a way to have list of potential extends ?

class BaseService<T extends RootModel> {
  RxValue<T> _rxModel;

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

  // final AppStateService _appStateService = locator<AppStateService>();

  /* runAndUpdateState(T object) { */
  /*setModelInAppState(T object) {
    _appStateService.setStateModel(this, object);
  }*/

  // Alex: Get associated model from AppStateService
  /*T getModelFromAppState() {
    return _appStateService.getState(T);
  }*/
}
