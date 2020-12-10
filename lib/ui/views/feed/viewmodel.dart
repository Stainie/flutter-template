import 'package:flutter_template/app/router.gr.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../models/feed.dart';
import '../../../services/core/api.dart';
import '../../../services/feed_service.dart';
import '../base_viewmodel.dart';

import '../../../app/locator.dart';

class FeedViewModel extends BaseViewModel {
  final FeedService _feedService = locator<FeedService>();
  final NavigationService _navigator = locator<NavigationService>();

  List<Feed> feed = List();

  Future getPosts(String id) async {
    setState(ViewState.Busy);
    feed = await _feedService.getFeedList(id);
    setState(ViewState.Idle);
  }

  void navigateToEntry(int id) {
    _navigator.navigateTo(Routes.feedView, arguments: feed[id]);
  }
}
