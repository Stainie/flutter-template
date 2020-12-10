import '../constants/exception.dart';
import '../locator.dart';
import '../models/collections/feed.dart';
import '../models/feed.dart';
import 'core/api.dart';

class FeedService {
  final Api _api = locator<Api>();

  Future<List<Feed>> getFeedList(String id) async {
    try {
      var exampleRaw = await _api.executeGetRequest("feed/$id");

      List<Feed> examplesList = FeedCollection.fromJson(exampleRaw).collection;

      return examplesList;
    } on CustomException catch (e) {
      return _api.handleException(e);
    }
  }
}
