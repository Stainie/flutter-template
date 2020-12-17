import 'dart:async';
import 'dart:convert';
import 'app_state.dart';
import '../app/locator.dart';
import '../constants/exception.dart';
import '../models/user.dart';
import 'core/api.dart';

class AuthenticationService {
  final Api _api = locator<Api>();
  final AppState _appState = locator<AppState>();

  Future<bool> authenticateUser(String text) async {
    try {
      User userModel = User(username: text, id: 1);

      var body = jsonEncode(userModel.toJson());
      final response = await _api.executePostRequest("authenticate", body);

      userModel.authenticated = response['authenticated'];
      _appState.user = userModel;
      return true;
    } on CustomException catch (e) {
      return _api.handleException(e);
    }
  }
}
