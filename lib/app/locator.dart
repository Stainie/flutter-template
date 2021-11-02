import 'package:get_it/get_it.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/auth_service.dart';
import '../services/core/app_state_service.dart';
import '../services/feed_service.dart';
import '../services/core/api_service.dart';
import '../services/user_prefs.dart';
import '../services/core/system.dart';
import '../ui/views/feed/feed_viewmodel.dart';
import '../ui/views/user/user_viewmodel.dart';

GetIt locator = GetIt.instance;

void setUpLocator() {
  // Register Singletons and Factories here
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => UserPrefs());
  locator.registerLazySingleton(() => SystemServices());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => AppStateService());
  locator.registerLazySingleton(() => FeedService());

  locator.registerFactory(() => UserViewModel());
  locator.registerFactory(() => FeedViewModel());
}
