import 'package:framework_challenge/features/login/domain/commands/register_command.dart';

abstract class LoginInterface {
  Future<int> call(LoginClass login);
}
