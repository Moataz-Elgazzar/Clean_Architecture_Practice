import 'package:clean_architecture_practice/core/connection/network_info.dart';
import 'package:clean_architecture_practice/features/user/data/datasources/user_local_data_source.dart';
import 'package:clean_architecture_practice/features/user/data/datasources/user_remote_data_source.dart';
import 'package:clean_architecture_practice/features/user/data/repositories/user_repositories_impl.dart';
import 'package:clean_architecture_practice/features/user/domain/usercases/getuser.dart';
import 'package:clean_architecture_practice/features/user/presentation/cubit/user_state.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitialState());

  eitherfailureoruser(int id) async {
    emit(UserLoadingState());
    final failureoruser = await Getuser(
      repositories: UserRepositoriesImpl(networkInfo: NetworkInputImpl(DataConnectionChecker()), userLocalDataSource: UserLocalDataSource(), userRemoteDataSource: UserRemoteDataSource()),
    ).call(id: id);

    failureoruser.fold((failure) => emit(UserErrorState(message: failure.message)), (user) => emit(UserSuccessState(user: user)));
  }
}
