import 'dart:async';
import 'dart:convert';

import 'package:flutter_template/models/network/api_result.dart';

import '../app/locator.dart';
import '../models/user.dart';
import 'core/base_service.dart';
import 'core/api_service.dart';
import '../state/app_state_constants.dart';

class AuthenticationService extends BaseService<User> {
  final ApiService _api = locator<ApiService>();

  AuthenticationService() {
    initialiseRxAppState();
  }

  Future<ApiResult<bool>> authenticateUser(String text) async {
    User userModel = User(username: text, id: 1);

    var body = jsonEncode(userModel.toJson());
    return await _api.request("authenticate", HttpMethod.post, data: body,
        onSuccess: (response) {
      bool authenticated = response.data['authenticated'];
      userModel.authenticated = authenticated;
      appStateService.setState({APP_STATE_KEYS.USER: userModel});
      return authenticated;
    });
  }

  User getUser() {
    return getAppState().state[APP_STATE_KEYS.USER];
  }
}
