import 'package:flutter_template/models/root_model.dart';

abstract class BaseModel<T> extends RootModel {
  BaseModel();

  Map toJson();

  T clone();

  T cloneWithMutation(Map<String, dynamic> mutation);
}
