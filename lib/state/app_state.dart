import '../models/user.dart';
import '../models/feed.dart';

class AppState {
  User _user;
  List<Feed> _feed;

  get user {
    return this._user;
  }

  set user(User user) {
    this._user = user;
  }

  get feed {
    return this._feed;
  }

  set feed(List<Feed> feed) {
    this._feed = feed;
  }
}
