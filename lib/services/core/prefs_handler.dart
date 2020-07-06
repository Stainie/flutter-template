import 'package:shared_preferences/shared_preferences.dart';

class PrefsHandler {
  static SharedPreferences _sharedPreferences;

  Future setInt(String key, int value) async {
    if (_sharedPreferences == null) {
      _sharedPreferences = await SharedPreferences.getInstance();
    }

    _sharedPreferences.setInt(key, value);
  }

  Future setString(String key, String value) async {
    if (_sharedPreferences == null) {
      _sharedPreferences = await SharedPreferences.getInstance();
    }

    _sharedPreferences.setString(key, value);
  }

  Future setBool(String key, bool value) async {
    if (_sharedPreferences == null) {
      _sharedPreferences = await SharedPreferences.getInstance();
    }

    _sharedPreferences.setBool(key, value);
  }

  Future<int> getInt(String key) async {
    if (_sharedPreferences == null) {
      _sharedPreferences = await SharedPreferences.getInstance();
    }

    return _sharedPreferences.getInt(key);
  }

  Future<String> getString(String key) async {
    if (_sharedPreferences == null) {
      _sharedPreferences = await SharedPreferences.getInstance();
    }

    return _sharedPreferences.getString(key);
  }

  Future<bool> getBool(String key) async {
    if (_sharedPreferences == null) {
      _sharedPreferences = await SharedPreferences.getInstance();
    }

    return _sharedPreferences.getBool(key);
  }
}
