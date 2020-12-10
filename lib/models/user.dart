import 'base_model.dart';

class User implements BaseModel {
  int id;
  String username;

  User({this.id, this.username}) : super();

  @override
  Map toJson() {
    return {"username": username};
  }

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    return User(id: parsedJson["id"], username: parsedJson["username"]);
  }
}
