import 'package:shared_preferences/shared_preferences.dart';

class MyShared {
  MyShared._init();

  static final instance = MyShared._init();

  void setString(String key, String value) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString(key, value);
  }

  void setBool(String key, bool value) async {
    final pref = await SharedPreferences.getInstance();
    pref.setBool(key, value);
  }

  Future<bool?> getBool(String key) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool(key);
  }
}
