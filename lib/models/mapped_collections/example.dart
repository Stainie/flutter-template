import '../example.dart';
import 'base_mapped_collections.dart';

class ExampleMappedCollection extends BaseMappedCollections<ExampleModel> {
  ExampleMappedCollection(Map<int, ExampleModel> collection)
      : super(collection);

  factory ExampleMappedCollection.fromJson(List parsedJson) {
    Map<int, ExampleModel> map = Map<int, ExampleModel>();

    parsedJson.forEach(
        (element) => map[element["id"]] = ExampleModel.fromJson(element));

    return ExampleMappedCollection(map);
  }
}
