import 'core/api.dart';

import 'package:flutter_template/services/base_service.dart';
import 'package:stacked/stacked.dart';

import '../app/locator.dart';
import '../models/collections/feed.dart';
import '../models/feed.dart';

FeedCollection defaultFeedCollection = FeedCollection([]);

class FeedService extends BaseService<FeedCollection>
    with ReactiveServiceMixin {
  FeedService() {
    initialiseRxAppState();
    initialiseRxModel(defaultFeedCollection);
    listenToReactiveValues([super.getRxModel(), super.getRxAppState()]);
  }

  final Api _api = locator<Api>();

  Future<void> retrieveFeedList(int id) async {
    try {
      var feedRaw = await _api.executeGetRequest("feed/$id");
      setRxModelValue(FeedCollection.fromJson(feedRaw));
    } on CustomException catch (e) {
      return _api.handleException(e);
    }
  }

  List<Feed> getFeedList() {
    return getRxModelValue().collection;
  }
}
