import 'package:framework_challenge/features/login/domain/commands/check_biometric_command.dart';

abstract class CheckBiometricInterface {
  Future<CheckBiometricClass> call(String username);
}
