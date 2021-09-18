import 'package:stacked/stacked_annotations.dart';

import '../ui/views/feed/feed_view.dart';
import '../ui/views/user/user_view.dart';

@StackedApp(routes: [
  CupertinoRoute(page: UserView, initial: true),
  CupertinoRoute(page: FeedView)
])
class App {
  /** This class has no puporse besides housing the annotation that generates the required functionality **/
}
