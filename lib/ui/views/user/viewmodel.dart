import 'package:flutter_template/app/router.gr.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/locator.dart';
import '../../../services/auth_service.dart';
import '../base_viewmodel.dart';

class UserViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigator = locator<NavigationService>();

  Future authenticateUser(String text) async {
    setState(ViewState.Busy);

    bool response = await _authenticationService.authenticateUser(text);

    setState(ViewState.Idle);
    if (response) {
      _navigator.navigateTo(Routes.feedView);
    }
  }
}
