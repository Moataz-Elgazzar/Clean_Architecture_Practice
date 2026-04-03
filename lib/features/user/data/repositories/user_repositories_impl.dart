import 'package:clean_architecture_practice/core/connection/network_info.dart';
import 'package:clean_architecture_practice/core/error/expensions.dart';
import 'package:clean_architecture_practice/core/error/failure.dart';
import 'package:clean_architecture_practice/features/user/data/datasources/user_local_data_source.dart';
import 'package:clean_architecture_practice/features/user/data/datasources/user_remote_data_source.dart';
import 'package:clean_architecture_practice/features/user/domain/entities/user_entities.dart';
import 'package:clean_architecture_practice/features/user/domain/repositories/user_repositories.dart';
import 'package:dartz/dartz.dart';

class UserRepositoriesImpl implements UserRepositories {
  final NetworkInfo networkInfo;
  final UserLocalDataSource userLocalDataSource;
  final UserRemoteDataSource userRemoteDataSource;
  UserRepositoriesImpl({required this.networkInfo, required this.userLocalDataSource, required this.userRemoteDataSource});
  @override
  Future<Either<Failure, UserEntities>> getuser({required int id}) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteUser = await userRemoteDataSource.getUser(id);
        userLocalDataSource.saveUser(remoteUser);
        return Right(remoteUser);
      } on ServerException catch (e) {
        return Left(Failure(message: e.errorModel.errorMessage));
      }
    } else {
      try {
        final localUser = userLocalDataSource.getUser();
        return Right(localUser!);
      } on CacheException catch (e) {
        return Left(Failure(message: e.message));
      }
    }
  }
}
