import 'package:shared_preferences/shared_preferences.dart';

class SheredPreferences {
  static late SharedPreferences pref;

  static init() async {
    pref = await SharedPreferences.getInstance();
  }

  static setData(String key, dynamic value) {
    if (value is int) {
      pref.setInt(key, value);
    }
    if (value is String) {
      pref.setString(key, value);
    }
    if (value is bool) {
      pref.setBool(key, value);
    }
    if (value is double) {
      pref.setDouble(key, value);
    }
    if(value is List<String>) {
      pref.setStringList(key, value);
    }
  }

  static dynamic getData(String key) {
    return pref.get(key);
  }

  static removeData(String key) {
    pref.remove(key);
  }

  static clearData() {
    pref.clear();
  }
}
