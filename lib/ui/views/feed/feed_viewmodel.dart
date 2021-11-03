import 'package:flutter_template/app/app.router.dart';
import 'package:flutter_template/models/network/api_result.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/locator.dart';
import '../../../models/feed.dart';
import '../../../services/auth_service.dart';
import '../../../services/feed_service.dart';
import '../../../state/app_state.dart';
import '../../../state/app_state_constants.dart';

/* 
Steps to enable a ReactiveViewModel to listen to a Service

1. In order to listen to notifications from a Service, add the Service
identifier to the reactiveServices @override. In this example,
the FeedService will be listened to for changes.

2. Prepare 'getters' that will be used in the attached Views. In this case,
'feed' will retrieve the feed list from the FeedService, 'appState' will
retrieve the global app state from the FeedService and 'userName' will retrieve 
the user name from the global app state. These three getters appear in 
FeedView which uses FeedViewModel in its ViewModelBuilder.

Note: Each time the listened-to Service notifies the ReactiveViewModel that 
an update has occurred, the three getters are re-run because a new instance of the
ReactiveViewModel is created for the attached Views.

3. Follow the instructions in feed_service.dart to set up the notification
from Service to ReactiveViewModel.
*/

class FeedViewModel extends FutureViewModel {
  final FeedService _feedService = locator<FeedService>();
  final NavigationService _navigator = locator<NavigationService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  List<Feed> get feed => _feedService.getRxModelList();
  AppState get appState => _feedService.getAppState();
  String get userName => appState.state[APP_STATE_KEYS.USER].username;

  Future retrieveFeedList() async {
    await _feedService.retrieveFeedList(_authenticationService.getUser().id)
      ..when(success: (_) {
        setBusy(false);
      }, error: (error) {
        setError(error.error);
      });
  }

  void navigateToEntry(int id) {
    _navigator.navigateTo(Routes.feedView, arguments: feed[id]);
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_feedService];

  @override
  Future futureToRun() => retrieveFeedList();
}
