import 'package:flutter_template/models/feed.dart';
import 'package:stacked/stacked.dart';

import '../app/locator.dart';
import '../models/collections/feed.dart';
import '../state/app_state_constants.dart';
import 'base_service_list.dart';
import 'core/api_service.dart';

/*
Steps to enable a Service to notify ReactiveViewModels of state changes

1. Use the ReactiveServiceMixin to enable the notification functionailty.

2. In the Service constructor, call the listenToReactiveValues function with
an array of RxValue, RxList or RxSet values that represent the values to
be listened to. Any ReactiveViewModels that are listening to this service
will then be reconstructed.

3. BaseService implements a mechanism that listens for changes in
global app state. To notify listening ReactiveViewModels of global app state
changes, call initialiseRxAppState() and add super.getRxAppState() to the
values in the listenToReactiveValues array.

4. BaseService implements a mechanism allowing the Service to host it's own
(non-global) Model. To notify listening ReactiveViewModels of changes to
state in this Model, call initialiseRxModel() with the default Model value as
a parameter, then add super.getRxModel() to the values in the listenToReactiveValues
array.
*/

class FeedService extends BaseServiceList<Feed> with ReactiveServiceMixin {
  FeedService() {
    initialiseRxModel(DEFAULT_FEED_COLLECTION.collection);
    listenToReactiveValues([getRxModelList()]);
  }

  final Api _api = locator<Api>();

  Future<void> retrieveFeedList(int? id) async {
    try {
      var feedRaw = await _api.executeGetRequest("feed/$id");
      rxAdd(FeedCollection.fromJson(feedRaw));
    } on CustomException catch (e) {
      return _api.handleException(e);
    }
  }
}
