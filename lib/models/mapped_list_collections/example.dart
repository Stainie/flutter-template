import '../example.dart';
import 'base_mapped_list_collections.dart';

class ExampleMappedListCollection
    extends BaseMappedListCollections<ExampleModel> {
  ExampleMappedListCollection(Map<int, List<ExampleModel>> collection)
      : super(collection);

  factory ExampleMappedListCollection.fromJson(List parsedJson) {
    Map<int, List<ExampleModel>> map = Map<int, List<ExampleModel>>();

    parsedJson.forEach((element) => map
        .putIfAbsent(element["id"], () => <ExampleModel>[])
        .add(ExampleModel.fromJson(element)));

    return ExampleMappedListCollection(map);
  }
}
