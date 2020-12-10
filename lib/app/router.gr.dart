// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../ui/views/feed/view.dart';
import '../ui/views/user/view.dart';

class Routes {
  static const String userView = '/';
  static const String feedView = '/feed-view';
  static const all = <String>{
    userView,
    feedView,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.userView, page: UserView),
    RouteDef(Routes.feedView, page: FeedView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    UserView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const UserView(),
        settings: data,
      );
    },
    FeedView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => FeedView(),
        settings: data,
      );
    },
  };
}
