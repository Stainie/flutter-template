import 'package:flutter_template/models/base_model.dart';
import 'package:flutter_template/models/root_model.dart';

import '../../state/app_state.dart';

class AppStateService {
  AppState state = AppState();

  void setState(RootModel mutation) {
    AppState newState = state.clone(mutation);
    state = newState;
  }
}
