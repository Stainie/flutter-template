import 'package:flutter_template/CONSTANTS/view_state.dart';
import 'package:flutter_template/models/example.dart';

import '../../../locator.dart';
import '../../../services/api.dart';
import '../base_viewmodel.dart';

class ExampleViewModel extends BaseViewModel {
  final Api _api = locator<Api>();

  Future<ExampleModel> getExample(String idText) async {
    setState(ViewState.Busy);

    var response = await _api.getExample();

    if (response == null) {
      setState(ViewState.Idle);
      return ExampleModel(int.tryParse(idText), "");
    }

    setState(ViewState.Idle);
    return response;
  }
}
