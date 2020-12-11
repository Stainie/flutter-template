import 'package:auto_route/auto_route_annotations.dart';

import '../ui/views/feed/feed_view.dart';
import '../ui/views/user/user_view.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  MaterialRoute(page: UserView, initial: true),
  MaterialRoute(page: FeedView)
])
class $Router {}
