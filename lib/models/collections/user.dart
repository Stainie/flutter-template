import '../user.dart';
import 'base_collection.dart';

class UserCollection extends BaseCollection<User> {
  UserCollection(collection) : super(collection);

  factory UserCollection.fromJson(List parsedJson) {
    List<User> collection = parsedJson.map((e) => User.fromJson(e)).toList();

    return UserCollection(collection);
  }
}
