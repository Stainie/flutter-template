import 'base_model.dart';

class ModelExample implements BaseModel {
  int id;
  String name;

  ModelExample(this.id, this.name) : super();

  @override
  Map toJson() {
    return {"id": id, "name": name};
  }

  factory ModelExample.fromJson(Map<String, dynamic> parsedJson) {
    return ModelExample(parsedJson["id"], parsedJson["name"]);
  }
}
