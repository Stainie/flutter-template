import '../models/user.dart';
import '../models/feed.dart';

class AppState {
  User _user;
  List<Feed> _feed;

  // _productData illustrative of a large data set
  List<Map<String, dynamic>> _productData = [
    {"productId": "123", "productName": "A Lego Crocodile"},
    {"productId": "456", "productName": "A paper Twig"}
    // .... 1000's more records, long time to clone ...
  ];

  get productData {
    return this._productData;
  }

  set productData(value) {
    this._productData = value;
  }

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

  AppState clone() {
    AppState newState = AppState();

    // Clone news feed and user data

    if (this.user != null) newState.user = this.user.clone();
    if (this.feed != null) {
      newState.feed = feed.map((item) {
        return item.clone();
      }).toList();
    }

    // Don't bother cloning productData, too expensive .....
    newState.productData = this.productData;

    return newState;
  }
}
