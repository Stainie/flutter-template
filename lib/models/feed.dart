import 'base_model.dart';

class Feed implements BaseModel {
  String name;
  String description;

  Feed(this.name, this.description) : super();

  @override
  Map toJson() {
    return {"title": name, "body": description};
  }

  factory Feed.fromJson(Map<String, dynamic> parsedJson) {
    return Feed(parsedJson["title"], parsedJson["body"]);
  }

  Feed clone() {
    return Feed(this.name, this.description);
  }
}
