import 'dart:async';
import 'dart:convert';

import 'package:flutter_template/constants/exception.dart';
import 'package:flutter_template/models/user.dart';

import '../app/locator.dart';
import 'core/api.dart';

class AuthenticationService {
  StreamController<User> userStream = StreamController<User>();

  final Api _api = locator<Api>();

  Future<bool> authenticateUser(String text) async {
    try {
      User userModel = User(username: text);

      var body = jsonEncode(userModel.toJson());
      userModel = await _api.executePostRequest("authenticate", body);

      userStream.add(userModel);

      return true;
    } on CustomException catch (e) {
      return _api.handleException(e);
    }
  }
}
