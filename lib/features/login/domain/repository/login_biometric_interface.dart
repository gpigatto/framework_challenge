import 'package:framework_challenge/features/login/domain/commands/register_command.dart';

abstract class LoginBiometricInterface {
  Future<LoginClass> call(String username);
}
