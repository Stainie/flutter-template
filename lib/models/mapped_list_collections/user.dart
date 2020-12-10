import '../user.dart';
import 'base_mapped_list_collections.dart';

class UserMappedListCollection extends BaseMappedListCollections<User> {
  UserMappedListCollection(Map<int, List<User>> collection) : super(collection);

  factory UserMappedListCollection.fromJson(List parsedJson) {
    Map<int, List<User>> map = Map<int, List<User>>();

    parsedJson.forEach((element) => map
        .putIfAbsent(element["id"], () => <User>[])
        .add(User.fromJson(element)));

    return UserMappedListCollection(map);
  }
}
