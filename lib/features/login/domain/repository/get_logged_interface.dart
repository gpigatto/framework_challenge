import 'package:framework_challenge/features/login/domain/commands/get_logged_command.dart';

abstract class GetLoggedInterface {
  Future<LoggedClass> call();
}
