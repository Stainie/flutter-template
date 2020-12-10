import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutter_template/ui/views/feed/view.dart';
import 'package:flutter_template/ui/views/user/view.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  MaterialRoute(page: UserView, initial: true),
  MaterialRoute(page: FeedView)
])
class $Router {}
