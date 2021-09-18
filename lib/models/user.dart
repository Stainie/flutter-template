import 'base_model.dart';

class User implements BaseModel<User> {
  int? id;
  String? username;
  bool? authenticated;

  User({this.id, this.username, this.authenticated}) : super();

  @override
  Map toJson() {
    return {"id": id, "username": username, "authenticated": authenticated};
  }

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    return User(
        id: parsedJson["id"],
        username: parsedJson["username"] ?? "",
        authenticated: parsedJson["authenticated"] ?? false);
  }

  @override
  User clone() {
    return User(
        id: this.id,
        username: this.username,
        authenticated: this.authenticated);
  }

  @override
  User cloneWithMutation(Map<String, dynamic> mutation) {
    // TODO: implement cloneWithMutation
    throw UnimplementedError();
  }
}
