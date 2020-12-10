import 'package:flutter_template/models/feed.dart';
import 'package:flutter_template/services/core/api.dart';
import 'package:flutter_template/services/feed_service.dart';
import 'package:flutter_template/ui/views/base_viewmodel.dart';

import '../../../app/locator.dart';

class FeedModel extends BaseViewModel {
  final FeedService _feedService = locator<FeedService>();

  List<Feed> feed = List();

  Future getPosts(String id) async {
    setState(ViewState.Busy);
    feed = await _feedService.getFeedList(id);
    setState(ViewState.Idle);
  }
}
