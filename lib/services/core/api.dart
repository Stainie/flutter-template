import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;

import '../../constants/api_errors.dart';
import '../../constants/exception.dart';

class Api {
  Future executeGetRequest(String route) async {
    bool internet = await _checkConnection();

    if (!internet) {
      var e = {"type": ApiErrors.NO_INTERNET};
      throw CustomException(e);
    }

    /* http.Response response = await http
        .get(Uri.encodeFull(route), headers: {"Accept": "application/json"}); */

    http.Response response;

    if (route.startsWith('feed')) {
      response = http.Response(
          '{ "data": [ { "title": "Strong turnout for Ajax", "body": "What a game that was" }, { "title": "Another rainy day", "body": "Just like yesterday" } ] }',
          200);
    } else {
      response = http.Response('{"error": "Access Denied"}', 403);
    }

    if (response.statusCode == 403) {
      var e = {"type": ApiErrors.ACCESS_DENIED};
      throw CustomException(e);
    }

    if (response.statusCode == 500) {
      var e = {"type": ApiErrors.OTHER_ERROR, "body": "Server error"};

      throw CustomException(e);
    }

    var respBody = jsonDecode(response.body);

    if (response.statusCode != 200) {
      print(route);

      var e = {"type": ApiErrors.OTHER_ERROR, "body": respBody["messages"]};
      throw CustomException(e);
    }

    return respBody["data"];
  }

  Future executePostRequest(String route, String body) async {
    bool internet = await _checkConnection();

    if (!internet) {
      var e = {"type": ApiErrors.NO_INTERNET};
      throw CustomException(e);
    }

    /* http.Response response = await http.post(Uri.encodeFull(route),
        headers: {
          "Accept": "application/json",
          "Content-type": "application/json"
        },
        body: body); */

    http.Response response;

    if (route == "authenticate") {
      response = http.Response('{ "data": { "authenticated": true } }', 200);
    } else {
      response = http.Response('{"error": "Access Denied"}', 403);
    }

    if (response.statusCode == 403) {
      var e = {"type": ApiErrors.ACCESS_DENIED};
      throw CustomException(e);
    }

    if (response.statusCode == 500) {
      var e = {"type": ApiErrors.OTHER_ERROR, "body": "Server error"};

      throw CustomException(e);
    }

    var respBody = jsonDecode(response.body);

    if (response.statusCode != 200) {
      print(route);

      var e = {"type": ApiErrors.OTHER_ERROR, "body": respBody["messages"]};
      throw CustomException(e);
    }

    return respBody["data"];
  }

  Future<bool> _checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      return false;
    }

    return true;
  }

  handleException(e) {
    print(e.cause);
    switch (e.cause) {
      case ApiErrors.ACCESS_DENIED:
        break;
      case ApiErrors.WRONG_VERSION:
        break;
      case ApiErrors.NO_INTERNET:
        break;
      case ApiErrors.OTHER_ERROR:
        break;
    }
    return null;
  }
}
