import 'package:flutter_keychain/flutter_keychain.dart';
import 'package:framework_challenge/features/login/domain/commands/register_command.dart';
import 'package:framework_challenge/features/login/domain/repository/save_biometric_interface.dart';

class SaveBiometricData extends SaveBiometricInterface {
  @override
  Future<bool> call(LoginClass login) async {
    try {
      await FlutterKeychain.put(
        key: "${login.username}_pass",
        value: login.pin,
      );

      return true;
    } catch (_) {
      return false;
    }
  }
}
