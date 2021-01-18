import '../models/base_model.dart';
import '../models/collections/feed.dart';
import '../models/user.dart';
import 'package:flutter_template/models/root_model.dart';

class AppState {
  Map<Type, dynamic> stateValues;

  AppState({this.stateValues});

  BaseModel setModel(BaseModel model) {
    BaseModel newModel = model.clone();
    stateValues[model.runtimeType] = newModel;
    return newModel;
  }

  User get user => stateValues[User];
  FeedCollection get feed => stateValues[FeedCollection];

  AppState clone(List<BaseModel> models) {
    Map<Type, dynamic> clonedValues = Map.from(stateValues);

    models.forEach((model) {
      clonedValues[model.runtimeType] = model.clone();
    });

    return AppState(stateValues: clonedValues);
  }
}
