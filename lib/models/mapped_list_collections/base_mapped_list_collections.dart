import '../base_model.dart';

abstract class BaseMappedListCollections<T extends BaseModel> {
  Map<int, List<T>> collection;

  BaseMappedListCollections(this.collection);
}
