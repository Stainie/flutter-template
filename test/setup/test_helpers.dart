import 'package:flutter_template/app/locator.dart';
import 'package:flutter_template/services/auth_service.dart';
import 'package:mockito/mockito.dart';
import 'package:stacked_services/stacked_services.dart';

class AuthenticationServiceMock extends Mock implements AuthenticationService {}

class NavigationServiceMock extends Mock implements NavigationService {}

AuthenticationService getAndRegisterAuthServiceMock() {
  var service = AuthenticationServiceMock();
  locator.registerSingleton<AuthenticationService>(service);
  return service;
}

NavigationService getAndRegisterNavServiceMock() {
  var service = NavigationServiceMock();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

void unregisterServices() {
  locator.unregister<AuthenticationService>();
  locator.unregister<NavigationService>();
}
