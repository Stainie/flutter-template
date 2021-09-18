import 'package:flutter_template/models/collections/base_collection.dart';
import 'package:observable_ish/observable_ish.dart';

import 'mixins/app_state_base_mixin.dart';

class BaseServiceList<T extends BaseCollection> with AppStateServiceBaseMixin {
  late T collection;
  late RxList _rxModelList;

  initialiseRxModel(T value) {
    this._rxModelList = RxList.from(value.collection);
    this.collection = value;
  }

  RxList getRxModelList() {
    return this._rxModelList;
  }

  List getModelAsList() {
    return getRxModelList().toList();
  }

  T getModel() {
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
