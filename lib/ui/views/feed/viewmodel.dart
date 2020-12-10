import 'package:flutter_template/models/feed.dart';
import 'package:flutter_template/services/core/api.dart';
import 'package:flutter_template/services/feed_service.dart';
import 'package:flutter_template/ui/views/base_viewmodel.dart';

import '../../../locator.dart';

class FeedModel extends BaseViewModel {
  final FeedService _feedService = locator<FeedService>();

  Future<List<Feed>> getPosts(String id) async {
    setState(ViewState.Busy);

    var response = await _feedService.getFeedList(id);

    if (response == null) {
      setState(ViewState.Idle);
      return [];
    }

    setState(ViewState.Idle);
    return response;
  }
}
