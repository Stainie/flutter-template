import 'dart:async';
import 'dart:convert';

import '../app/locator.dart';
import '../models/user.dart';
import 'base_service.dart';
import 'core/api.dart';
import '../state/app_state_constants.dart';

class AuthenticationService extends BaseService<User> {
  final Api _api = locator<Api>();

  AuthenticationService() {
    initialiseRxAppState();
  }

  Future<bool> authenticateUser(String text) async {
    try {
      User userModel = User(username: text, id: 1);

      var body = jsonEncode(userModel.toJson());
      final response = await _api.executePostRequest("authenticate", body);

      userModel.authenticated = response['authenticated'];
      appStateService.setState({APP_STATE_KEYS.USER: userModel});

      return true;
    } on CustomException catch (e) {
      return _api.handleException(e);
    }
  }

  User getUser() {
    return getAppState().state[APP_STATE_KEYS.USER];
  }
}
