import '../feed.dart';
import 'base_collection.dart';

class FeedCollection extends BaseCollection<Feed> {
  FeedCollection(List<Feed> collection) : super(collection);

  factory FeedCollection.fromJson(List parsedJson) {
    List<Feed> collection = parsedJson.map((e) => Feed.fromJson(e)).toList();

    return FeedCollection(collection);
  }
}
