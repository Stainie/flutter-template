import 'package:flutter_template/models/collections/base_collection.dart';
import 'package:flutter_template/models/mapped_collections/base_mapped_collections.dart';

import '../models/base_model.dart';

class AppState {
  Map<String, dynamic> state;

  AppState({this.state});

  AppState clone() {
    Map<String, dynamic> clonedState = Map.from(state);

    clonedState.forEach((key, value) {
      if (value is BaseModel ||
          value is BaseCollection ||
          value is BaseMappedCollections) {
        clonedState[key] = value.clone();
      }
    });

    return AppState(state: clonedState);
  }
}
