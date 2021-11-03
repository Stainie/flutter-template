import 'package:flutter_template/models/base_model.dart';
import 'package:stacked/stacked.dart';

import '../mixins/app_state_base_mixin.dart';

class BaseServiceList<T extends BaseModel> with AppStateServiceBaseMixin {
  late List<T> collection;
  late ReactiveList<T> _rxModelList;

  initialiseRxModel(List<T> value) {
    this._rxModelList = ReactiveList<T>.from(value);
    this.collection = value;
  }

  ReactiveList<T> getRxModelList() {
    return this._rxModelList;
  }

  List<T> getModelAsList() {
    return getRxModelList().toList().cast<T>();
  }

  List<T> getModel() {
    this.collection.clear();
    getModelAsList().forEach((item) {
      this.collection.add(item);
    });
    return this.collection;
  }

  void rxAdd(value) {
    getRxModelList().add(value);
  }

  void rxAddList(list) {
    getRxModelList().addAll([...list]);
  }

  void rxInsert(value, int index) {
    var list = getRxModelList();
    if (list.length >= index) {
      list.insert(index, value);
    } else {
      getRxModelList().add(value);
    }
  }

  void rxClear() {
    getRxModelList().clear();
  }

  void clearCollection() {
    this.collection.clear();
  }
}
