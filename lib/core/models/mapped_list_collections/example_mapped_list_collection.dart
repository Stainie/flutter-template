import 'package:flutter_template/core/models/mapped_list_collections/base_mapped_list_collections.dart';
import 'package:flutter_template/core/models/model_example.dart';

class ExampleMappedListCollection
    extends BaseMappedListCollections<ModelExample> {
  ExampleMappedListCollection(Map<int, List<ModelExample>> collection)
      : super(collection);

  factory ExampleMappedListCollection.fromJson(List parsedJson) {
    Map<int, List<ModelExample>> map = Map<int, List<ModelExample>>();

    parsedJson.forEach((element) => map
        .putIfAbsent(element["id"], () => <ModelExample>[])
        .add(ModelExample.fromJson(element)));

    return ExampleMappedListCollection(map);
  }
}
