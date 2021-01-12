import 'dart:async';
import '../state/app_state.dart';
import '../selectors/app_state_selectors.dart';

class AppStateService {
  StreamController<AppState> appStateStream = StreamController<AppState>();

  AppState state = AppState();

  AppStateSelectors selectors = AppStateSelectors();

  void setState(mutation) {
    AppState newState = state.clone();
    mutation(newState);
    state = newState;
    selectors.updateSelectors(state);
    this.notify();
  }

  void notify() {
    appStateStream.add(state);
  }
}
