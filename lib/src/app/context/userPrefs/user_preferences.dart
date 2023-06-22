import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static UserPreferences instance = UserPreferences._internal();

  factory UserPreferences() {
    return instance;
  }

  UserPreferences._internal();
  SharedPreferences? _prefs;

  void setBool(String key, bool value) {
    _prefs!.setBool(key, value);
  }

  void setString(String key, String value) {
    _prefs!.setString(key, value);
  }

  String getString(String key) {
    return _prefs!.getString(key) ?? "";
  }

  bool getBool(String key) {
    return _prefs!.getBool(key) ?? false;
  }

  void removeKey(String key) {
    _prefs!.remove(key);
  }

  void clearStorage() {
    _prefs!.clear();
  }

  setupPrefs() async {
    _prefs = await SharedPreferences.getInstance().catchError((onError) {
      log("Error inicializando preferencias: $onError");
    });
  }
}
