import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:framework_challenge/core/infrastructure/service_locator.dart';
import 'package:framework_challenge/features/login/domain/commands/check_biometric_command.dart';
import 'package:framework_challenge/features/login/domain/commands/register_command.dart';
import 'package:framework_challenge/features/login/presentation/bloc/check_biometric_bloc.dart';
import 'package:framework_challenge/features/login/presentation/bloc/get_logged_bloc.dart';
import 'package:framework_challenge/features/login/presentation/bloc/login_biometric_bloc.dart';
import 'package:framework_challenge/features/login/presentation/bloc/login_bloc.dart';
import 'package:framework_challenge/features/login/presentation/bloc/register_bloc.dart';
import 'package:framework_challenge/features/login/presentation/bloc/save_biometric_bloc.dart';
import 'package:framework_challenge/features/login/presentation/bloc/user_exist_bloc.dart';
import 'package:framework_challenge/features/login/presentation/utils/validation.dart';
import 'package:framework_challenge/features/login/presentation/widgets/login_button.dart';
import 'package:framework_challenge/features/login/presentation/widgets/pin_field.dart';
import 'package:framework_challenge/features/login/presentation/widgets/username_field.dart';
import 'package:framework_challenge/shared/app_theme.dart';
import 'package:framework_challenge/shared/widgets/space.dart';
import 'package:framework_challenge/shared/widgets/toast.dart';
import 'package:local_auth/local_auth.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RegisterBloc>(
          create: (_) => RegisterBloc(serviceLocator()),
        ),
        BlocProvider<LoginBloc>(
          create: (_) => LoginBloc(serviceLocator()),
        ),
        BlocProvider<CheckBiometricBloc>(
          create: (_) => CheckBiometricBloc(serviceLocator()),
        ),
        BlocProvider<UserExistBloc>(
          create: (_) => UserExistBloc(serviceLocator()),
        ),
        BlocProvider<LoginBiometricBloc>(
          create: (_) => LoginBiometricBloc(serviceLocator()),
        ),
        BlocProvider<SaveBiometricBloc>(
          create: (_) => SaveBiometricBloc(serviceLocator()),
        ),
      ],
      child: const _LoginBody(),
    );
  }
}

class _LoginBody extends StatefulWidget {
  const _LoginBody({Key? key}) : super(key: key);

  @override
  __LoginBodyState createState() => __LoginBodyState();
}

class __LoginBodyState extends State<_LoginBody> {
  final LocalAuthentication auth = LocalAuthentication();
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: false,
  );

  final pinFocus = FocusNode();
  final confirmPinFocus = FocusNode();

  bool signedUp = false;

  String user = "";
  String pin = "";
  String confirmPin = "";

  CheckBiometricClass biometric = CheckBiometricClass(
    device: false,
    user: false,
  );

  bool userChecked = false;

  // get pin from keychain using biometric
  _loginByBiometric() async {
    const _message = "Please, Verify your identity";

    if (biometric.user && await auth.authenticate(localizedReason: _message)) {
      context.read<LoginBiometricBloc>().add(LoginBiometricLoad(user));
    }
  }

  // bloc handler to check if user + pin match
  _loginBlocHandler(stateContext, state) async {
    if (state is LoginLoaded) {
      if (state.correct) {
        CustomToast().successToast("Bem vindo!", ToastGravity.BOTTOM);

        context.read<GetLoggedBloc>().add(GetLoggedLoad());

        Navigator.pop(context);
      } else {
        CustomToast().errorToast("Usuário Inválido..", ToastGravity.BOTTOM);
      }
    } else if (state is LoginError) {
      CustomToast().errorToast(
        "Algo de errado não está certo..",
        ToastGravity.BOTTOM,
      );
    }
  }

  // bloc handler to save biometric after register and login
  _registerBlocHandler(stateContext, state) async {
    const _message = "Please, Verify your identity";

    if (state is RegisterLoaded) {
      if (biometric.device &&
          await auth.authenticate(localizedReason: _message)) {
        context.read<SaveBiometricBloc>().add(
              SaveBiometricLoad(
                LoginClass(
                  username: user,
                  pin: pin,
                ),
              ),
            );
      }

      context.read<LoginBloc>().add(
            LoginLoad(
              LoginClass(
                username: user,
                pin: pin,
              ),
            ),
          );
    } else if (state is RegisterError) {
      CustomToast().errorToast("Something went wrong..", ToastGravity.BOTTOM);
    }
  }

  _validateFields() {
    return Validation().validateFields(
      user,
      pin,
      confirmPin,
      userChecked,
      signedUp,
    );
  }

  _checkUser() {
    if (_validateFields()) return null;

    context.read<UserExistBloc>().add(UserExistLoad(user));
    context.read<CheckBiometricBloc>().add(CheckBiometricLoad(user));
  }

  _login() {
    if (_validateFields()) return null;

    context.read<LoginBloc>().add(
          LoginLoad(
            LoginClass(
              username: user,
              pin: pin,
            ),
          ),
        );
  }

  _register() {
    if (_validateFields()) return null;

    context.read<RegisterBloc>().add(
          RegisterLoad(
            LoginClass(
              username: user,
              pin: pin,
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            _loginBlocHandler(context, state);
          },
        ),
        BlocListener<RegisterBloc, RegisterState>(
          listener: (context, state) {
            _registerBlocHandler(context, state);
          },
        ),
        BlocListener<CheckBiometricBloc, CheckBiometricState>(
          listener: (context, state) {
            if (state is CheckBiometricLoaded) {
              biometric = state.checkBiometricClass;
            }
          },
        ),
        BlocListener<UserExistBloc, UserExistState>(
          listener: (context, state) {
            if (state is UserExistLoaded) {
              setState(() {
                userChecked = true;
                signedUp = state.exist;
              });

              if (state.exist) {
                pageController.animateToPage(
                  1,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
                _loginByBiometric();
              } else {
                pageController.animateToPage(
                  2,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              }
            }
          },
        ),
        BlocListener<LoginBiometricBloc, LoginBiometricState>(
          listener: (context, state) {
            if (state is LoginBiometricLoaded) {
              if (state is LoginBiometricLoaded) {
                context.read<LoginBloc>().add(
                      LoginLoad(
                        LoginClass(
                          username: state.login_information.username,
                          pin: state.login_information.pin,
                        ),
                      ),
                    );
              }
            }
          },
        ),
      ],
      child: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          _userCheckStep(),
          _loginStep(),
          _registerStep(),
        ],
      ),
    );
  }

  _registerStep() {
    const _align = CrossAxisAlignment.stretch;
    const _padding = 16.0;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: _padding),
        child: Column(
          crossAxisAlignment: _align,
          children: [
            const VSpace(16),
            _hello("Welcome "),
            const VSpace(16),
            _subtitle(
              "Please, set a Pin below for your new account.",
            ),
            const VSpace(24),
            PinField(
              title: "Pin",
              onComplete: (value) {
                pin = value;
              },
            ),
            const VSpace(24),
            PinField(
              title: "Confirm Pin",
              onComplete: (value) {
                confirmPin = value;
                _register();
              },
            ),
            const VSpace(24),
            LoginButton(label: "Register", function: () => _register()),
          ],
        ),
      ),
    );
  }

  _loginStep() {
    const _align = CrossAxisAlignment.stretch;
    const _padding = 16.0;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: _padding),
        child: Column(
          crossAxisAlignment: _align,
          children: [
            const VSpace(16),
            _hello("Welcome back "),
            const VSpace(16),
            _subtitle(
              "Please, check your Pin below.",
            ),
            const VSpace(24),
            PinField(
              title: "Pin",
              onComplete: (value) {
                pin = value;

                _login();
              },
            ),
            const VSpace(24),
            LoginButton(label: "Login", function: () => _login()),
          ],
        ),
      ),
    );
  }

  _userCheckStep() {
    const _align = CrossAxisAlignment.stretch;
    const _padding = 16.0;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: _padding),
        child: Column(
          crossAxisAlignment: _align,
          children: [
            const VSpace(16),
            _title("Hey There!"),
            const VSpace(16),
            _subtitle(
              "Please, enter your user name below to Sign in or Register a new Account.",
            ),
            const VSpace(24),
            UsernameField(
              onChage: (value) {
                user = value;
              },
              onSubmit: (value) {
                _checkUser();
                FocusScope.of(context).requestFocus(pinFocus);
              },
            ),
            const VSpace(24),
            LoginButton(label: "Next", function: () => _checkUser()),
          ],
        ),
      ),
    );
  }

  _title(title) {
    final _color = AppTheme().colors.green;
    const _textSize = 42.0;

    return Text(
      title,
      style: TextStyle(
        color: _color,
        fontSize: _textSize,
      ),
    );
  }

  _subtitle(title) {
    final _color = AppTheme().colors.green;
    const _textSize = 20.0;

    return Text(
      title,
      style: TextStyle(
        color: _color,
        fontSize: _textSize,
      ),
    );
  }

  _hello(text) {
    final _textColor = AppTheme().colors.green;
    final _textHighlight = AppTheme().colors.green;
    const _textSize = 42.0;

    return Row(
      children: [
        Text(
          text,
          style: TextStyle(
            color: _textColor,
            fontSize: _textSize,
          ),
        ),
        Text(
          user,
          style: TextStyle(
            color: _textHighlight,
            fontSize: _textSize,
          ),
        ),
      ],
    );
  }
}
