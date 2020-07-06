import 'base_model.dart';

class ExampleModel implements BaseModel {
  int id;
  String name;

  ExampleModel(this.id, this.name) : super();

  @override
  Map toJson() {
    return {"id": id, "name": name};
  }

  factory ExampleModel.fromJson(Map<String, dynamic> parsedJson) {
    return ExampleModel(parsedJson["id"], parsedJson["name"]);
  }
}
