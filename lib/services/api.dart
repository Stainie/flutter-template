import '../locator.dart';
import '../constants/exception.dart';
import '../models/example.dart';
import 'core/request_handler.dart';

class Api {
  RequestHandler _requestHandler = locator<RequestHandler>();

  _handleException(e) {
    print(e.cause);
    return null;
  }

  Future<ExampleModel> getExample() async {
    try {
      var exampleRaw = await _requestHandler.executeGetRequest("example");

      ExampleModel example = ExampleModel.fromJson(exampleRaw);

      return example;
    } on CustomException catch (e) {
      return _handleException(e);
    }
  }
}
