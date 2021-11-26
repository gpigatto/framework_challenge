import 'package:framework_challenge/features/login/domain/commands/register_command.dart';

abstract class SaveBiometricInterface {
  Future<bool> call(LoginClass login);
}
