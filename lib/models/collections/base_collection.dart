import 'package:flutter_template/models/root_model.dart';

import '../base_model.dart';

abstract class BaseCollection<T extends BaseModel> extends RootModel {
  List<T> collection;

  BaseCollection(this.collection);

  Map toJson(String collectionName) {
    return {collectionName: collection.map((e) => e.toJson()).toList()};
  }

  List<T> clone() {
    return List<T>.from(collection);
  }
}
