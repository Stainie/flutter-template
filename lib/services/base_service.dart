import 'dart:js_util';

import 'package:flutter_template/app/locator.dart';
import 'package:flutter_template/models/base_model.dart';
import 'package:flutter_template/models/root_model.dart';
import 'package:flutter_template/services/core/app_state_service.dart';

// TODO: using RootModel until we learn a way to have list of potential extends ?
class BaseService<T extends RootModel> {
  final AppStateService _appStateService = locator<AppStateService>();

  runAndUpdateState(T object) {
    _appStateService.setState(object);
  }
}
