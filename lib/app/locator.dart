import 'package:get_it/get_it.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/auth_service.dart';
import '../services/core/api.dart';
import '../services/core/prefs_handler.dart';
import '../services/core/system.dart';
import '../ui/views/feed/viewmodel.dart';
import '../ui/views/user/viewmodel.dart';

GetIt locator = GetIt.instance;

void setUpLocator() {
  // Register Singletons and Factories here
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => PrefsHandler());
  locator.registerLazySingleton(() => SystemServices());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => NavigationService());

  locator.registerFactory(() => UserViewModel());
  locator.registerFactory(() => FeedViewModel());
}
