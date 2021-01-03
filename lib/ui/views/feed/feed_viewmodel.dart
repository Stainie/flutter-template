import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/locator.dart';
import '../../../app/router.gr.dart';
import '../../../models/feed.dart';
import '../../../services/auth_service.dart';
import '../../../services/feed_service.dart';
import '../../../services/reactive_service_example.dart';

class FeedViewModel extends ReactiveViewModel {
  final FeedService _feedService = locator<FeedService>();
  final NavigationService _navigator = locator<NavigationService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final ReactiveServiceExample _reactiveServiceExample =
      locator<ReactiveServiceExample>();

  List<Feed> feed = List();

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
