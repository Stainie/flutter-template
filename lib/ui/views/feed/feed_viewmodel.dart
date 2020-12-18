import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/locator.dart';
import '../../../app/router.gr.dart';
import '../../../models/feed.dart';
import '../../../services/feed_service.dart';
import '../../../services/app_state_service.dart';

class FeedViewModel extends BaseViewModel {
  final FeedService _feedService = locator<FeedService>();
  final NavigationService _navigator = locator<NavigationService>();
  final AppStateService _appStateService = locator<AppStateService>();

  get computed {
    return _appStateService.selectors.results;
  }

  get state {
    return _appStateService.state;
  }

  List<Feed> feed = List();

  Future getPosts(String id) async {
    setBusy(true);
    feed = await _feedService.getFeedList(id);

    //  update global state
    _appStateService.setState((state) {
      state.feed = feed;
    });

    setBusy(false);
  }

  void navigateToEntry(int id) {
    _navigator.navigateTo(Routes.feedView, arguments: feed[id]);
  }
}
