import 'package:observable_ish/observable_ish.dart';
import 'package:stacked/stacked.dart';

import '../../state/app_state.dart';
import '../../state/initial_state.dart';

class AppStateService with ReactiveServiceMixin {
  AppStateService() {
    listenToReactiveValues([rxAppState]);
  }

  RxValue<AppState> rxAppState =
      RxValue<AppState>(initial: AppState(state: initialState));

  AppState getAppState() {
    return this.rxAppState.value;
  }

  void setState(Map<String, dynamic> mutation) {
    AppState newState = rxAppState.value.clone();
    mutation.forEach((key, value) {
      newState.state[key] = value;
    });
    rxAppState.value = newState;
  }
}
