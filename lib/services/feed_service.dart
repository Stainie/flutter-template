import 'package:flutter_template/services/base_service.dart';
import 'package:flutter_template/services/core/app_state_service.dart';
import 'package:stacked/stacked.dart';
import 'package:observable_ish/observable_ish.dart';

import '../app/locator.dart';
import '../models/collections/feed.dart';
import '../models/feed.dart';
import 'core/api.dart';

FeedCollection defaultFeedCollection = FeedCollection([]);

class FeedService extends BaseService<FeedCollection>
    with ReactiveServiceMixin {
  FeedService() {
    initialiseRxModel(defaultFeedCollection);
    listenToReactiveValues([super.getRxModel()]);
  }

  final Api _api = locator<Api>();

  Future<void> retrieveFeedList(int id) async {
    try {
      var feedRaw = await _api.executeGetRequest("feed/$id");
      setRxModelValue(FeedCollection.fromJson(feedRaw));
    } on CustomException catch (e) {
      return _api.handleException(e);
    }

    // Alex
    // setModelInAppState(feedList);
  }

  List<Feed> getFeedList() {
    return getRxModelValue().collection;
  }
}
