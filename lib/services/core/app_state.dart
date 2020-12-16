import 'package:flutter_template/services/core/default_data.dart';

class AppState {
  String defaultError;

  Map app = {'user': {}..addAll(defaultUserData), 'page': '/login'};

  Map data = {}..addAll(defaultData);

  Map ui = {
    'login': {'error': '', 'navigateToHome': false},
    'home': {
      'initialTabIndex': 0,
      'enablefactoryTab': false,
      'lastSelectedTab': 0
    },
  };

  AppState([Map ui, Map data, Map app]) {
    if (ui != null) {
      this.ui = cloneMap(ui);
    }

    if (data != null) {
      this.data = cloneMap(data);
    }

    if (app != null) {
      this.app = cloneMap(app);
    }
  }

  Map cloneMap(Map source) {
    Map destination = Map();
    source.forEach((k, v) => {
          if (v is Map)
            {destination[k] = cloneMap(v)}
          else if (v is List)
            {destination[k] = cloneList(v)}
          else
            {destination[k] = v}
        });

    return destination;
  }

  List cloneList(List source) {
    List destination = List();
    source.forEach((v) => {
          if (v is Map)
            {destination.add(cloneMap(v))}
          else if (v is List)
            {destination.add(cloneList(v))}
          else
            {destination.add(v)}
        });

    return destination;
  }

  AppState clone() {
    return new AppState(this.ui, this.data, this.app);
  }
}
