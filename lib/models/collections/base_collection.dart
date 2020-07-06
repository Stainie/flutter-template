import '../base_model.dart';

abstract class BaseCollection<T extends BaseModel> {
  List<T> collection;

  BaseCollection(this.collection);

  Map toJson(String collectionName) {
    return {collectionName: collection.map((e) => e.toJson()).toList()};
  }
}
