import 'package:flutter_template/services/base_service.dart';
import 'package:flutter_template/services/core/app_state_service.dart';

import '../app/locator.dart';
import '../models/collections/feed.dart';
import '../models/feed.dart';
import 'core/api.dart';

class FeedService extends BaseService {
  final Api _api = locator<Api>();

  Future<List<Feed>> getFeedList(int id) async {
    try {
      var feedRaw = await _api.executeGetRequest("feed/$id");

      FeedCollection feedList = FeedCollection.fromJson(feedRaw);

      runAndUpdateState(feedList);

      return feedList.collection;
    } on CustomException catch (e) {
      return _api.handleException(e);
    }
  }
}
