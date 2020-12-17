import 'dart:async';
import '../state/app_state.dart';

class AppStateService {
  StreamController<AppState> appStateStream = StreamController<AppState>();

  AppState state = AppState();

  void setState(mutation) {
    mutation(state);
    this.notify();
  }

  void notify() {
    appStateStream.add(state);
  }
}
