import 'package:flutter_template/models/base_model.dart';
import 'package:flutter_template/models/root_model.dart';
import 'package:flutter_template/services/base_service.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/locator.dart';
import '../../state/app_state.dart';
import '../../state/initial_state.dart';
import '../feed_service.dart';
import '../auth_service.dart';
import '../../models/collections/feed.dart';
import '../../models/user.dart';

class AppStateService {
  AppState appState = AppState(state: initialState);

  AppState getAppState() {
    return this.appState;
  }

  void setState(Map<String, dynamic> mutation) {}

  /* Map<Type, BaseService> allServices = {
    FeedCollection: locator<FeedService>(),
    User: locator<AuthenticationService>()
  }; */

  /* void setStateModel(BaseService callingService, RootModel model) {
    callingService.notifyViewModels(state.setModel(model));
  } */

  // Alex: change 'mutation' to 'model'
  /* void setState(List<RootModel> models) {
    AppState newState = state.clone(models);
    state = newState;
    notifyAllServices();
  } */

  /* void notifyAllServices() {
    allServices.forEach((modelType, service) {
      service.notifyViewModels(state.stateValues[modelType]);
    });
  } */

  // Alex: Implement getState
  /* RootModel getState(Type modelType) {
    return state.stateValues[modelType];
  } */
}
