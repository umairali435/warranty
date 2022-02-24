import 'package:shared_preferences/shared_preferences.dart';

class KeyValueStorageBase {
  static SharedPreferences? _sharedPrefs;
  static Future<void> init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  const KeyValueStorageBase._();
  static KeyValueStorageBase? _instance;
  static KeyValueStorageBase get instance =>
      _instance ?? const KeyValueStorageBase._();
  T? getCommon<T>(String key) {
    try {
      switch (T) {
        case String:
          return _sharedPrefs!.getString(key) as T?;
        case int:
          return _sharedPrefs!.getInt(key) as T?;
        case bool:
          return _sharedPrefs!.getBool(key) as T?;
        case double:
          return _sharedPrefs!.getDouble(key) as T?;
        default:
          return _sharedPrefs!.get(key) as T?;
      }
    } on Exception {
      return null;
    }
  }

  Future<bool> setCommon<T>(String key, T value) {
    switch (T) {
      case String:
        return _sharedPrefs!.setString(key, value as String);
      case int:
        return _sharedPrefs!.setInt(key, value as int);
      case bool:
        return _sharedPrefs!.setBool(key, value as bool);
      case double:
        return _sharedPrefs!.setDouble(key, value as double);
      default:
        return _sharedPrefs!.setString(key, value as String);
    }
  }
}
