import 'package:clean_architecture_practice/core/service/dio/dio_endpoint.dart';
import 'package:clean_architecture_practice/core/service/dio/dio_provider.dart';
import 'package:clean_architecture_practice/features/user/data/models/user_model.dart';

class UserRemoteDataSource {
 
 Future<UserModel> getUser(int id) async {
    final response = await  DioProvider.get(path: "${DioEndpoint.user}/${id.toString()}"); 
    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load user');
    }
  }
}