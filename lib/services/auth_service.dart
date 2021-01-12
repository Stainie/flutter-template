import 'dart:async';
import 'dart:convert';
import 'app_state_service.dart';
import '../app/locator.dart';
import '../models/user.dart';
import 'core/api.dart';

class AuthenticationService {
  final Api _api = locator<Api>();
  final AppStateService _appStateService = locator<AppStateService>();

  User _user;
  User get user => _user;

  Future<bool> authenticateUser(String text) async {
    try {
      User userModel = User(username: text, id: 1);

      var body = jsonEncode(userModel.toJson());
      final response = await _api.executePostRequest("authenticate", body);

      userModel.authenticated = response['authenticated'];

      //  Update global app state
      _appStateService.setState((state) {
        state.user = userModel;
      });

      return true;
    } on CustomException catch (e) {
      return _api.handleException(e);
    }
  }
}
