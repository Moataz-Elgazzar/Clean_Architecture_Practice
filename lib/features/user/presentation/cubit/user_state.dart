import 'package:clean_architecture_practice/features/user/domain/entities/user_entities.dart';

class UserState {}

class UserInitialState extends UserState {}

class UserLoadingState extends UserState {}

class UserSuccessState extends UserState {
  final UserEntities user;
  UserSuccessState({required this.user});
}

class UserErrorState extends UserState {
  final String message;

  UserErrorState({required this.message});
}