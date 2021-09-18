import 'package:flutter_template/app/locator.dart';
import 'package:flutter_template/services/auth_service.dart';
import 'package:mockito/mockito.dart';
import 'package:stacked_services/stacked_services.dart';

class AuthenticationServiceMock extends Mock implements AuthenticationService {}

class NavigationServiceMock extends Mock implements NavigationService {}

AuthenticationService getAndRegisterAuthServiceMock() {
  _removeExistingRegistration<AuthenticationService>();
  var service = AuthenticationServiceMock();
  locator.registerSingleton<AuthenticationService>(service);
  return service;
}

NavigationService getAndRegisterNavServiceMock() {
  _removeExistingRegistration<NavigationService>();
  var service = NavigationServiceMock();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

void registerServices() {
  getAndRegisterAuthServiceMock();
  getAndRegisterNavServiceMock();
}

void unregisterServices() {
  locator.unregister<AuthenticationService>();
  locator.unregister<NavigationService>();
}

void _removeExistingRegistration<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
