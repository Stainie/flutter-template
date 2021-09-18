import '../base_model.dart';
import '../root_model.dart';

class BaseCollection<T extends BaseModel> extends RootModel {
  List<T> collection;

  BaseCollection(this.collection);

  Map toJson(String collectionName) {
    return {collectionName: collection.map((e) => e.toJson()).toList()};
  }

  void add(T value) {
    collection.add(value);
  }

  void clear() {
    collection.clear();
  }

  BaseCollection clone() {
    List<T> cloneCollection = [];
    this.collection.forEach((element) {
      cloneCollection.add(element.clone());
    });
    return BaseCollection(this.collection);
  }

  List<T> sublist(int start, [int? end]) => collection.sublist(start, end);

  int get length => collection.length;
}
