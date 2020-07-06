import '../example.dart';
import 'base_collection.dart';

class ExampleCollection extends BaseCollection<ExampleModel> {
  ExampleCollection(collection) : super(collection);

  @override
  Map toJson(String collectionName) {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  factory ExampleCollection.fromJson(List parsedJson) {
    List<ExampleModel> collection =
        parsedJson.map((e) => ExampleModel.fromJson(e)).toList();

    return ExampleCollection(collection);
  }
}
