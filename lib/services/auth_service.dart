import 'dart:async';
import 'dart:convert';

import '../app/locator.dart';
import '../constants/exception.dart';
import '../models/user.dart';
import 'core/api.dart';

class AuthenticationService {
  final Api _api = locator<Api>();

  User _user;
  User get user => _user;

  Future<bool> authenticateUser(String text) async {
    try {
      User userModel = User(username: text);

      var body = jsonEncode(userModel.toJson());
      userModel = await _api.executePostRequest("authenticate", body);

      _user = userModel;

      return true;
    } on CustomException catch (e) {
      return _api.handleException(e);
    }
  }
}
