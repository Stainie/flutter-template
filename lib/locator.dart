import 'package:flutter_template/ui/views/example/viewmodel.dart';
import 'package:get_it/get_it.dart';

import 'services/core/request_handler.dart';
import 'services/core/prefs_handler.dart';
import 'services/core/system.dart';
import 'services/api.dart';

GetIt locator = GetIt.instance;

void setUpLocator() {
  // Register Singletons and Factories here
  locator.registerLazySingleton(() => RequestHandler());
  locator.registerLazySingleton(() => PrefsHandler());
  locator.registerLazySingleton(() => SystemServices());
  locator.registerLazySingleton(() => Api());

  locator.registerFactory(() => ExampleViewModel());
}
