import 'package:observable_ish/observable_ish.dart';
import 'package:flutter_template/models/root_model.dart';

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
}
