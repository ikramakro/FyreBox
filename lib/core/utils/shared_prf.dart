import 'package:fyrebox/core/utils/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  final log = Logger();
  static SharedPreferences? _preferences;

  ///
  /// List of const keys
  ///
  static const String onboardingCountKey = 'onBoardingCount';
  static const String notificationsCountKey = 'notificationsCount';
  static const String accessTokenKey = 'accessToken';
  static const String refreshTokenKey = 'refreshToken';

  ///
  /// Setters and getters
  ///
  int get onBoardingPageCount => getFromDisk(onboardingCountKey) ?? 0;
  set onBoardingPageCount(int count) => saveToDisk(onboardingCountKey, count);

  int get setNotificationsCount => getFromDisk(notificationsCountKey) ?? 0;
  set setNotificationsCount(int count) =>
      saveToDisk(notificationsCountKey, count);

  dynamic get accessToken => getFromDisk(accessTokenKey);
  set accessToken(token) => saveToDisk(accessTokenKey, token);

  dynamic get refreshToken => getFromDisk(refreshTokenKey);

  ///
  ///initializing instance
  ///
  init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  dynamic getFromDisk(String key) {
    var value = _preferences!.get(key);
    // log.log('@_getFromDisk. key: $key value: $value');
    return value;
  }

  void saveToDisk<T>(String key, T? content) {
    // log.d('@_saveToDisk. key: $key value: $content');

    if (content is String) {
      _preferences!.setString(key, content);
    }
    if (content is bool) {
      _preferences!.setBool(key, content);
    }
    if (content is int) {
      _preferences!.setInt(key, content);
    }
    if (content is double) {
      _preferences!.setDouble(key, content);
    }
    if (content is List<String>) {
      _preferences!.setStringList(key, content);
    }

    if (content == null) {
      _preferences!.remove(key);
    }
  }
}
