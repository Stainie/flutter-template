import '../user.dart';
import 'base_mapped_collections.dart';

class UserMappedCollection extends BaseMappedCollections<User> {
  UserMappedCollection(Map<int, User> collection) : super(collection);

  factory UserMappedCollection.fromJson(List parsedJson) {
    Map<int, User> map = Map<int, User>();

    parsedJson
        .forEach((element) => map[element["id"]] = User.fromJson(element));

    return UserMappedCollection(map);
  }
}
