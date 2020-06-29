import 'package:get_it/get_it.dart';

import 'core/services/api.dart';
import 'core/services/prefs_handler.dart';
import 'core/services/system.dart';

GetIt locator = GetIt.instance;

void setUpLocator() {
  // Register Singletons and Factories here
  locator.registerLazySingleton(() => PrefsHandler());
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => SystemServices());
}
