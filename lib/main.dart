import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:framework_challenge/core/infrastructure/service_locator.dart';
import 'package:framework_challenge/features/home/presentation/pages/home.dart';
import 'package:framework_challenge/features/login/presentation/bloc/get_logged_bloc.dart';

void main() async {
  await initServiceLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetLoggedBloc>(
          create: (BuildContext context) => GetLoggedBloc(serviceLocator()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Home(),
      ),
    );
  }
}
