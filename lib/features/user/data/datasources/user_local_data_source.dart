import 'package:clean_architecture_practice/core/error/expensions.dart';
import 'package:clean_architecture_practice/core/service/local/shered_preferences.dart';
import 'package:clean_architecture_practice/features/user/data/models/user_model.dart';

class UserLocalDataSource {
  saveUser(UserModel? user) {
    if (user != null) {
      SheredPreferences.saveUser(user);
    } else {
      throw CacheException("No Internet Connection");
    }
  }

  UserModel? getUser() {
    final user = SheredPreferences.getuser();
    if (user != null) {
      return user;
    } else {
      throw CacheException("No Cached User Found");
    }
  }
}
