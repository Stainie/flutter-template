// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../ui/views/feed/feed_view.dart';
import '../ui/views/user/user_view.dart';

class Routes {
  static const String userView = '/';
  static const String feedView = '/feed-view';
  static const all = <String>{
    userView,
    feedView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.userView, page: UserView),
    RouteDef(Routes.feedView, page: FeedView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    UserView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const UserView(),
        settings: data,
      );
    },
    FeedView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => FeedView(),
        settings: data,
      );
    },
  };
}
