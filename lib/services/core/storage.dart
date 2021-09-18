import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:mockito/mockito.dart';

class FakeStorage extends Fake implements FlutterSecureStorage {
  Map<String, String> fakeStorage = {};
  bool firstRun = true;

  @override
  Future<String?> read({
    required String key,
    IOSOptions? iOptions = IOSOptions.defaultOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
  }) async {
    return (fakeStorage.containsKey(key)) ? fakeStorage[key] : null;
  }

  @override
  Future<void> write({
    required String key,
    required String? value,
    IOSOptions? iOptions = IOSOptions.defaultOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
  }) async {
    if (value != null) {
      fakeStorage[key] = value;
    } else {
      if (fakeStorage.containsKey(key)) {
        fakeStorage.remove(key);
      }
    }
  }

  @override
  Future<void> delete({
    required String key,
    IOSOptions? iOptions = IOSOptions.defaultOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
  }) async {
    if (fakeStorage.containsKey(key)) {
      fakeStorage.remove(key);
    }
  }

  @override
  Future<void> deleteAll({
    IOSOptions? iOptions = IOSOptions.defaultOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
  }) async {
    fakeStorage.clear();
  }

  @override
  Future<Map<String, String>> readAll({
    IOSOptions? iOptions = IOSOptions.defaultOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
  }) async {
    Map<String, String> fakeStorageCopy = Map.from(fakeStorage);
    return fakeStorageCopy;
  }
}

class Storage {
  FlutterSecureStorage? _storage;
  FlutterSecureStorage _realStorage = FlutterSecureStorage();
  FakeStorage _fakeStorage = FakeStorage();
  bool firstRun = true;

  Storage({bool fake = false}) {
    if (fake) {
      this.setFakeStorage();
    } else {
      this.setRealStorage();
    }
  }

  void setRealStorage() {
    this._storage = _realStorage;
    this._verifyStorage = _realVerifyStorage;
  }

  void setFakeStorage() {
    this._storage = _fakeStorage;
    this._verifyStorage = _fakeVerifyStorage;
  }

  Future<Map?> get verifyStorage => _verifyStorage!();

  Future<Map?> Function()? _verifyStorage;

  Future<Map?> _realVerifyStorage() async {
    SharedPreferences? _prefs;

    try {
      dynamic tmp = await SharedPreferences.getInstance();
      _prefs = tmp;
    } catch (e) {
      print(e);
    }

    if (_prefs!.getBool('first_run') ?? true) {
      // Delete all storage if this is a fresh install of the app
      await _storage?.deleteAll();

      _prefs.setBool('first_run', false);
      return {};
    } else {
      return _storage?.readAll();
    }
  }

  Future<Map?> _fakeVerifyStorage() async {
    if (firstRun) {
      await _storage?.deleteAll();
      firstRun = false;
      return {};
    } else {
      return _storage?.readAll();
    }
  }

  Future<void> write(String key, String value) async {
    _storage?.write(key: key, value: value);
    return;
  }

  Future<String?> read(String key) async {
    String? value = await _storage?.read(key: key);
    return value;
  }

  Future<void> delete(String key) async {
    await _storage?.delete(key: key);
    return;
  }

  Future<void> deleteAll() async {
    await _storage?.deleteAll();
    return;
  }
}
