import 'dart:async';
import 'package:flutter_template/services/core/app_state.dart';

class StateService {
  StreamController<AppState> stateStream = StreamController<AppState>();
  AppState state = AppState();

  void merge(Map<String, dynamic> mutation) {
    this.state.app = {}..addAll(this.state.app)..addAll(mutation);
    stateStream.add(this.state);
  }
}
