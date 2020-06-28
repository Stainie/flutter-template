import '../model_example.dart';
import 'base_collection.dart';

class ExampleCollection extends BaseCollection<ModelExample> {
  ExampleCollection(collection) : super(collection);

  @override
  Map toJson(String collectionName) {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  factory ExampleCollection.fromJson(List parsedJson) {
    List<ModelExample> collection =
        parsedJson.map((e) => ModelExample.fromJson(e)).toList();

    return ExampleCollection(collection);
  }
}
