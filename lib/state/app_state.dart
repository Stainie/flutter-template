import '../models/base_model.dart';
import '../models/collections/feed.dart';
import '../models/user.dart';

class AppState {
  Map<Type, dynamic> stateValues;

  AppState({this.stateValues});

  User get user => stateValues[User];
  FeedCollection get feed => stateValues[FeedCollection];

  AppState clone(BaseModel model) {
    Map<Type, dynamic> clonedValues = Map.from(stateValues);

    clonedValues[model.runtimeType] = model;

    return AppState(stateValues: clonedValues);
  }
}
