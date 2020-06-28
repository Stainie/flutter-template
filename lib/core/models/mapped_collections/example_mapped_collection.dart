import 'package:flutter_template/core/models/mapped_collections/base_mapped_collections.dart';
import 'package:flutter_template/core/models/model_example.dart';

class ExampleMappedCollection extends BaseMappedCollections<ModelExample> {
  ExampleMappedCollection(Map<int, ModelExample> collection)
      : super(collection);

  factory ExampleMappedCollection.fromJson(List parsedJson) {
    Map<int, ModelExample> map = Map<int, ModelExample>();

    parsedJson.forEach(
        (element) => map[element["id"]] = ModelExample.fromJson(element));

    return ExampleMappedCollection(map);
  }
}
