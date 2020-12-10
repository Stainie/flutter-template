import 'package:auto_route/auto_route_annotations.dart';
import '../ui/views/feed/view.dart';
import '../ui/views/user/view.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  MaterialRoute(page: UserView, initial: true),
  MaterialRoute(page: FeedView)
])
class $Router {}
