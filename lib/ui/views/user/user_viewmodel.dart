import 'package:flutter_template/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/locator.dart';
import '../../../services/auth_service.dart';

class UserViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigator = locator<NavigationService>();

  String _username = "";
  String get username => _username;

  //  Called from _TextInput in user view
  void setUsername(String username) {
    _username = username;
  }

  Future authenticateUser() async {
    setBusy(true);

    await _authenticationService.authenticateUser(_username)
      ..when(success: (response) {
        if (response) {
          _navigator.navigateTo(Routes.feedView);
        }
      }, error: (error) {
        setError(true);
      });
  }
}
