import 'package:flutter_template/models/root_model.dart';

import '../base_model.dart';

abstract class BaseMappedCollections<T extends BaseModel> extends RootModel {
  Map<int, T> collection;

  BaseMappedCollections(this.collection);

  Map<int, T> clone() {
    return Map<int, T>.from(collection);
  }
}
