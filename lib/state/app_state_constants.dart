import 'dart:ui';

import '../models/collections/feed.dart';
import '../models/user.dart';

enum APP_STATE_KEYS { USER, APP, CONNECTIVITY }

User DEFAULT_MODEL_USER = User(username: null, id: null);
FeedCollection DEFAULT_FEED_COLLECTION = FeedCollection([]);

const Map<String, Locale> supportedLangsNames = {
  "English": const Locale('en', 'US'),
};

const Locale DEFAULT_LOCALE = const Locale('en', 'US');
