import '../models/base_model.dart';

class AppState {
  Map<String, dynamic> state;

  AppState({this.state});

  AppState clone() {
    Map<String, dynamic> clonedState = Map.from(state);

    clonedState.forEach((key, value) {
      if (value is BaseModel) {
        clonedState[key] = value.clone();
      }
    });

    return AppState(state: clonedState);
  }
}
