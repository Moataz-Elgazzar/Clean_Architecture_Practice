import 'package:clean_architecture_practice/core/error/failure.dart';
import 'package:clean_architecture_practice/features/user/domain/entities/user_entities.dart';
import 'package:clean_architecture_practice/features/user/domain/repositories/user_repositories.dart';
import 'package:dartz/dartz.dart';

class Getuser {
  final UserRepositories repositories;
  Getuser({required this.repositories});
  Future<Either<Failure, UserEntities>> call({required int id}) async {
    return repositories.getuser(id: id);
  }
}
