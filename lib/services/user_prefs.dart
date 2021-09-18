import 'dart:convert';

import '../app/locator.dart';
import 'core/storage.dart';

class UserPrefs {
  Storage storage = locator<Storage>();

  String _preferredLanguage = "en";

  void initUserPrefsFromStorage(Map s) async {
    if (s.containsKey("pref_lang")) {
      _preferredLanguage = s["pref_lang"];
    } else {
      _preferredLanguage = "English";
    }
  }

  String get preferredLanguage => _preferredLanguage;

  Future<Map<String, String>?> getLanguageWords() async {
    final words = await storage.read("current_language_words");
    if (words == null) {
      return null;
    }
    return Map.from(json.decode(words));
  }

  Future<void> saveLanguageWords(dynamic words) async {
    return await storage.write("current_language_words", json.encode(words));
  }
}
