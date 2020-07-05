import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_template/core/CONSTANTS/api_errors.dart';
import 'package:flutter_template/core/CONSTANTS/exception.dart';
import 'package:http/http.dart' as http;

class Api {
  Future executeGetRequest(String route) async {
    bool internet = await _checkConnection();

    if (!internet) {
      var e = {"type": ApiErrors.NO_INTERNET};
      throw CustomException(e);
    }

    http.Response response = await http
        .get(Uri.encodeFull(route), headers: {"Accept": "application/json"});

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

    http.Response response = await http.post(Uri.encodeFull(route),
        headers: {
          "Accept": "application/json",
          "Content-type": "application/json"
        },
        body: body);

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
}