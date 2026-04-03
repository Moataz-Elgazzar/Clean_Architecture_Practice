import 'dart:convert';

import 'package:clean_architecture_practice/features/user/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SheredPreferences {
  static late SharedPreferences pref;
  static const String kUser = 'user';

  static init() async {
    pref = await SharedPreferences.getInstance();
  }

  static saveUser(UserModel? user) {
    if (user == null) {
      return;
    }
    final userData = user.tojason();
    final userString = jsonEncode(userData);
    pref.setString(kUser, userString);
  }

  static UserModel? getuser() {
    final userString = pref.getString(kUser);
    if (userString == null) {
      return null;
    }
    final userDataTojson = jsonDecode(userString);
    return UserModel.fromJson(userDataTojson);
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
    if (value is List<String>) {
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
