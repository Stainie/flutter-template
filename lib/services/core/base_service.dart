import 'package:flutter_template/models/base_model.dart';
import 'package:stacked/stacked.dart';

import '../mixins/app_state_base_mixin.dart';

class BaseService<T extends BaseModel> with AppStateServiceBaseMixin {
  late T model;
  late ReactiveValue<T> _rxModel;

  initialiseRxModel(T value) {
    this.model = value;
    this._rxModel = ReactiveValue<T>(value);
  }

  ReactiveValue<T> getRxModel() {
    return this._rxModel;
  }

  void mutateRxModelValue(Map<String, dynamic> mutation) {
    setRxModelValue(getRxModelValue().cloneWithMutation(mutation));
  }

  setRxModelValue(value) {
    this._rxModel.value = value;
  }

  T getRxModelValue() {
    return this._rxModel.value;
  }
}
