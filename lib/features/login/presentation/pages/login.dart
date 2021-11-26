import 'package:flutter/cupertino.dart';
import 'package:framework_challenge/features/login/presentation/widgets/login_body.dart';
import 'package:framework_challenge/shared/widgets/body.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Body(
      child: LoginBody(),
    );
  }
}
