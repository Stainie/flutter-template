import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/locator.dart';
import '../../../app/router.gr.dart';
import '../../../models/feed.dart';
import '../../../services/auth_service.dart';
import '../../../services/feed_service.dart';
import '../../../services/app_state_service.dart';
import '../../../services/reactive_service_example.dart';

class FeedViewModel extends ReactiveViewModel {
  // TODO: deal with the appstate
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

  // Future getPosts(int id) async {
  //   setBusy(true);
  //   feed = await _feedService.getFeedList(id);

  //   //  update global state
  //   _appStateService.setState((state) {
  //     state.feed = feed;
  //   });

  //   setBusy(false);
  // }

  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final ReactiveServiceExample _reactiveServiceExample =
      locator<ReactiveServiceExample>();

  Future getPosts() async {
    feed = await runBusyFuture(
        _feedService.getFeedList(_authenticationService.user.id));
    notifyListeners();
  }

  void navigateToEntry(int id) {
    _navigator.navigateTo(Routes.feedView, arguments: feed[id]);
  }

  @override
  // TODO: implement reactiveServices
  List<ReactiveServiceMixin> get reactiveServices => [_reactiveServiceExample];
}
