import 'package:shared_preferences/shared_preferences.dart';

class SpUtil {
  static SharedPreferences _instance;
  static init() async {
    if (_instance == null) {
      _instance = await SharedPreferences.getInstance();
    }
  }

  static _getInstance() async {
    if (_instance == null) {
      _instance = await SharedPreferences.getInstance();
    }
    return _instance;
  }

  static String getString(String key, {String defaultValue = ""}) {
    SharedPreferences prefs = _getInstance();
    String value = prefs.getString(key);
    if (value != null) {
      return value;
    }
    return defaultValue;
  }

  static putString(String key, String value) {
    SharedPreferences prefs = _getInstance();
    prefs.setString(key, value);
  }

  static bool getBool(String key, {bool defaultValue = false}) {
    SharedPreferences prefs = _getInstance();
    bool value = prefs.getBool(key);
    if (value != null) {
      return value;
    }
    return defaultValue;
  }

  static putBool(String key, bool value) {
    SharedPreferences prefs = _getInstance();
    prefs.setBool(key, value);
  }
}
