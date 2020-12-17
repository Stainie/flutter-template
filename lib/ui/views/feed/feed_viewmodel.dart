import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/locator.dart';
import '../../../app/router.gr.dart';
import '../../../models/feed.dart';
import '../../../models/collections/feed.dart';
import '../../../services/feed_service.dart';
import '../../../services/app_state.dart';

class FeedViewModel extends BaseViewModel {
  final FeedService _feedService = locator<FeedService>();
  final NavigationService _navigator = locator<NavigationService>();
  final AppState _appState = locator<AppState>();

  get state {
    return _appState;
  }

  List<Feed> feed = List();

  Future getPosts(String id) async {
    setBusy(true);
    _appState.feed = await _feedService.getFeedList(id);
    setBusy(false);
  }

  void navigateToEntry(int id) {
    _navigator.navigateTo(Routes.feedView, arguments: feed[id]);
  }
}
