import 'package:clean_architecture_practice/core/service/dio/dio_provider.dart';
import 'package:clean_architecture_practice/core/service/local/shered_preferences.dart';
import 'package:clean_architecture_practice/features/user/presentation/cubit/user_cubit.dart';
import 'package:clean_architecture_practice/features/user/presentation/pages/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SheredPreferences.init();
  DioProvider.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(create: (context) => UserCubit()..eitherfailureoruser(1), child: const UserScreen()),
      debugShowCheckedModeBanner: false,
    );
  }
}
