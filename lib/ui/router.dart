import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_template/ui/views/feed/view.dart';

import 'views/user/view.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "user":
        return MaterialPageRoute(builder: (_) => UserView());
      case "feed":
        return MaterialPageRoute(builder: (_) => FeedView());
        break;
      case "feedEntry":
        // showcasing the argument extraction
        var entry = settings.arguments;
        return MaterialPageRoute(builder: (_) => Scaffold());
        break;
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text("No route defined for ${settings.name}"),
                  ),
                ));
        break;
    }
  }
}
