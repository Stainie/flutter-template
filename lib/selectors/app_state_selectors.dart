import '../state/app_state.dart';
import 'package:reselect/reselect.dart';
import 'app_state_selectors_results.dart';

class AppStateSelectors {
  AppStateSelectorsResults results = AppStateSelectorsResults();

  Function feedSelector;
  Function firstFeedItem;

  AppStateSelectors() {
    createSelectors();
  }

  void createSelectors() {
    feedSelector = (dynamic state) => state.feed;
    firstFeedItem = createSelector1(feedSelector,
        (feed) => feed != null && feed.length > 0 ? feed[0] : null);
  }

  void updateSelectors(AppState state) {
    results.feed = feedSelector(state);
    results.first = firstFeedItem(state);
  }
}
