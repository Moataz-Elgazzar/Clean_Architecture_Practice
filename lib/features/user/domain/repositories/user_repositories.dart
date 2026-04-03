import 'package:clean_architecture_practice/core/error/failure.dart';
import 'package:clean_architecture_practice/features/user/domain/entities/user_entities.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepositories {
 Future<Either<Failure, UserEntities>> getuser();
}
