import 'package:flutter_template/services/auth_service.dart';

import '../../../locator.dart';
import '../base_viewmodel.dart';

class UserViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  Future<bool> authenticateUser(String text) async {
    setState(ViewState.Busy);

    bool response = await _authenticationService.authenticateUser(text);

    setState(ViewState.Idle);
    return response;
  }
}
