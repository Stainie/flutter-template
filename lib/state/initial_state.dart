import '../models/collections/feed.dart';
import '../models/user.dart';
import 'app_state_constants.dart';

Map<String, dynamic> initialState = {
  APP_STATE_USER_KEY: User(username: null, id: null)
};
