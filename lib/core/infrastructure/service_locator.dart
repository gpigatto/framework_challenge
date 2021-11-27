import 'package:framework_challenge/features/cart/data/cart_data.dart';
import 'package:framework_challenge/features/cart/domain/commands/cart_command.dart';
import 'package:framework_challenge/features/cart/domain/repository/cart_interface.dart';
import 'package:framework_challenge/features/cart/presentation/bloc/cart_cubit.dart';
import 'package:framework_challenge/features/feed/data/feed_data.dart';
import 'package:framework_challenge/features/feed/domain/commands/feed_command.dart';
import 'package:framework_challenge/features/feed/domain/repository/feed_interface.dart';
import 'package:framework_challenge/features/feed/presentation/bloc/feed_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:framework_challenge/features/login/data/check_biometric_data.dart';
import 'package:framework_challenge/features/login/data/get_logged_data.dart';
import 'package:framework_challenge/features/login/data/login_biometric_data.dart';
import 'package:framework_challenge/features/login/data/login_data.dart';
import 'package:framework_challenge/features/login/data/logout_data.dart';
import 'package:framework_challenge/features/login/data/register_data.dart';
import 'package:framework_challenge/features/login/data/save_biometric_data.dart';
import 'package:framework_challenge/features/login/data/user_exist_data.dart';
import 'package:framework_challenge/features/login/domain/commands/check_biometric_command.dart';
import 'package:framework_challenge/features/login/domain/commands/get_logged_command.dart';
import 'package:framework_challenge/features/login/domain/commands/login_biometric_interface.dart';
import 'package:framework_challenge/features/login/domain/commands/login_command.dart';
import 'package:framework_challenge/features/login/domain/commands/logout_command.dart';
import 'package:framework_challenge/features/login/domain/commands/register_command.dart';
import 'package:framework_challenge/features/login/domain/commands/save_biometric_command.dart';
import 'package:framework_challenge/features/login/domain/commands/user_exist_interface.dart';
import 'package:framework_challenge/features/login/domain/repository/check_biometric_interface.dart';
import 'package:framework_challenge/features/login/domain/repository/get_logged_interface.dart';
import 'package:framework_challenge/features/login/domain/repository/login_biometric_interface.dart';
import 'package:framework_challenge/features/login/domain/repository/login_interface.dart';
import 'package:framework_challenge/features/login/domain/repository/logout_interface.dart';
import 'package:framework_challenge/features/login/domain/repository/register_interface.dart';
import 'package:framework_challenge/features/login/domain/repository/save_biometric_interface.dart';
import 'package:framework_challenge/features/login/domain/repository/user_exist_interface.dart';
import 'package:framework_challenge/features/login/presentation/bloc/check_biometric_bloc.dart';
import 'package:framework_challenge/features/login/presentation/bloc/get_logged_bloc.dart';
import 'package:framework_challenge/features/login/presentation/bloc/login_biometric_bloc.dart';
import 'package:framework_challenge/features/login/presentation/bloc/login_bloc.dart';
import 'package:framework_challenge/features/login/presentation/bloc/logout_bloc.dart';
import 'package:framework_challenge/features/login/presentation/bloc/register_bloc.dart';
import 'package:framework_challenge/features/login/presentation/bloc/save_biometric_bloc.dart';
import 'package:framework_challenge/features/login/presentation/bloc/user_exist_bloc.dart';

GetIt serviceLocator = GetIt.instance;

Future<void> initServiceLocator() async {
  await _register();
  await _login();
  await _getLogged();
  await _logout();
  await _saveBiometric();
  await _loginBiometric();
  await _checkBiometric();
  await _userExist();
  await _feed();
  await _cart();
}

Future<void> _register() async {
  //repositorio / acesso aos dados
  serviceLocator.registerLazySingleton<RegisterInterface>(() => RegisterData());
  //command / regra de negocio
  serviceLocator.registerLazySingleton(() => RegisterCommand(serviceLocator()));
  //bloc / estado
  serviceLocator.registerFactory(() => RegisterBloc(serviceLocator()));
}

Future<void> _login() async {
  //repositorio / acesso aos dados
  serviceLocator.registerLazySingleton<LoginInterface>(() => LoginData());
  //command / regra de negocio
  serviceLocator.registerLazySingleton(() => LoginCommand(serviceLocator()));
  //bloc / estado
  serviceLocator.registerFactory(() => LoginBloc(serviceLocator()));
}

Future<void> _getLogged() async {
  //repositorio / acesso aos dados
  serviceLocator
      .registerLazySingleton<GetLoggedInterface>(() => GetLoggedData());
  //command / regra de negocio
  serviceLocator
      .registerLazySingleton(() => GetLoggedCommand(serviceLocator()));
  //bloc / estado
  serviceLocator.registerFactory(() => GetLoggedBloc(serviceLocator()));
}

Future<void> _logout() async {
  //repositorio / acesso aos dados
  serviceLocator.registerLazySingleton<LogoutInterface>(() => LogoutData());
  //command / regra de negocio
  serviceLocator.registerLazySingleton(() => LogoutCommand(serviceLocator()));
  //bloc / estado
  serviceLocator.registerFactory(() => LogoutBloc(serviceLocator()));
}

Future<void> _saveBiometric() async {
  //repositorio / acesso aos dados
  serviceLocator
      .registerLazySingleton<SaveBiometricInterface>(() => SaveBiometricData());
  //command / regra de negocio
  serviceLocator
      .registerLazySingleton(() => SaveBiometricCommand(serviceLocator()));
  //bloc / estado
  serviceLocator.registerFactory(() => SaveBiometricBloc(serviceLocator()));
}

Future<void> _loginBiometric() async {
  //repositorio / acesso aos dados
  serviceLocator.registerLazySingleton<LoginBiometricInterface>(
      () => LoginBiometricData());
  //command / regra de negocio
  serviceLocator
      .registerLazySingleton(() => LoginBiometricCommand(serviceLocator()));
  //bloc / estado
  serviceLocator.registerFactory(() => LoginBiometricBloc(serviceLocator()));
}

Future<void> _checkBiometric() async {
  //repositorio / acesso aos dados
  serviceLocator.registerLazySingleton<CheckBiometricInterface>(
      () => CheckBiometricData());
  //command / regra de negocio
  serviceLocator
      .registerLazySingleton(() => CheckBiometricCommand(serviceLocator()));
  //bloc / estado
  serviceLocator.registerFactory(() => CheckBiometricBloc(serviceLocator()));
}

Future<void> _userExist() async {
  //repositorio / acesso aos dados
  serviceLocator
      .registerLazySingleton<UserExistInterface>(() => UserExistData());
  //command / regra de negocio
  serviceLocator
      .registerLazySingleton(() => UserExistCommand(serviceLocator()));
  //bloc / estado
  serviceLocator.registerFactory(() => UserExistBloc(serviceLocator()));
}

Future<void> _feed() async {
  //repositorio / acesso aos dados
  serviceLocator.registerLazySingleton<FeedInterface>(() => FeedData());
  //command / regra de negocio
  serviceLocator.registerLazySingleton(() => FeedCommand(serviceLocator()));
  //bloc / estado
  serviceLocator.registerFactory(() => FeedBloc(serviceLocator()));
}

Future<void> _cart() async {
  //repositorio / acesso aos dados
  serviceLocator.registerLazySingleton<CartInterface>(() => CartData());
  //command / regra de negocio
  serviceLocator.registerLazySingleton(() => CartCommand(serviceLocator()));
  //bloc / estado
  serviceLocator.registerFactory(() => CartCubit(serviceLocator()));
}
