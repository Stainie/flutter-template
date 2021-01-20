import '../models/collections/feed.dart';
import '../models/user.dart';

enum APP_STATE_KEYS { USER }

User DEFAULT_MODEL_USER = User(username: null, id: null);
FeedCollection DEFAULT_FEED_COLLECTION = FeedCollection([]);
