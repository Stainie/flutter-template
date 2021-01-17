import 'package:flutter_template/models/root_model.dart';

import '../base_model.dart';

abstract class BaseMappedListCollections<T extends BaseModel>
    extends RootModel {
  Map<int, List<T>> collection;

  BaseMappedListCollections(this.collection);

  Map<int, List<T>> clone() {
    return Map<int, List<T>>.from(collection);
  }
}
