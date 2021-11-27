import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:framework_challenge/core/infrastructure/service_locator.dart';
import 'package:framework_challenge/features/cart/presentation/bloc/cart_cubit.dart';
import 'package:framework_challenge/features/home/presentation/pages/home.dart';
import 'package:framework_challenge/features/login/presentation/bloc/get_logged_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

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
        BlocProvider(
          create: (context) => CartCubit(serviceLocator()),
        ),
      ],
      child: MaterialApp(
        title: 'Quitanda Framework',
        theme: ThemeData(
          textTheme: GoogleFonts.manropeTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: const Home(),
      ),
    );
  }
}
