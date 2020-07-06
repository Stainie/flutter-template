import '../base_model.dart';

abstract class BaseMappedCollections<T extends BaseModel> {
  Map<int, T> collection;

  BaseMappedCollections(this.collection);

  
}