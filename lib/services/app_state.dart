import '../models/user.dart';
import '../models/feed.dart';
import 'dart:async';

class AppState {
  StreamController<AppState> appStateStream = StreamController<AppState>();

  User _user;
  List<Feed> _feed;

  get user {
    return this._user;
  }

  set user(User user) {
    this._user = user;
    this.notify();
  }

  get feed {
    return this._feed;
  }

  set feed(List<Feed> feed) {
    this._feed = feed;
    this.notify();
  }

  void notify() {
    appStateStream.add(this);
  }
}
