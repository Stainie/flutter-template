import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/locator.dart';
import '../../../app/router.gr.dart';
import '../../../services/auth_service.dart';

class UserViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigator = locator<NavigationService>();

  String _username = "";
  String get username => _username;

  Future authenticateUser() async {
    setBusy(true);

    bool response = await _authenticationService.authenticateUser(_username);
    setBusy(false);
    if (response) {
      _navigator.navigateTo(Routes.feedView);
    }
  }

  void setUsername(String username) {
    _username = username;
  }
}
