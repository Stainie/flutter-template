// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/cupertino.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:flutter/material.dart';
import 'package:flutter_template/ui/views/feed/feed_view.dart' as _i3;
import 'package:flutter_template/ui/views/user/user_view.dart' as _i2;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i6;

class Routes {
  static const userView = '/';

  static const feedView = '/feed-view';

  static const all = <String>{
    userView,
    feedView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.userView,
      page: _i2.UserView,
    ),
    _i1.RouteDef(
      Routes.feedView,
      page: _i3.FeedView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.UserView: (data) {
      return _i4.CupertinoPageRoute<dynamic>(
        builder: (context) => const _i2.UserView(),
        settings: data,
      );
    },
    _i3.FeedView: (data) {
      final args = data.getArgs<FeedViewArguments>(nullOk: false);
      return _i4.CupertinoPageRoute<dynamic>(
        builder: (context) =>
            _i3.FeedView(key: args.key, id: args.id, name: args.name),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class FeedViewArguments {
  const FeedViewArguments({
    this.key,
    required this.id,
    required this.name,
  });

  final _i5.Key? key;

  final int id;

  final String name;
}

extension NavigatorStateExtension on _i6.NavigationService {
  Future<dynamic> navigateToUserView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.userView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToFeedView({
    _i5.Key? key,
    required int id,
    required String name,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.feedView,
        arguments: FeedViewArguments(key: key, id: id, name: name),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
