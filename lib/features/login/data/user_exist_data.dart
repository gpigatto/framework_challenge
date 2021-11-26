import 'package:framework_challenge/core/data/database.dart';
import 'package:framework_challenge/features/login/domain/repository/user_exist_interface.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

class UserExistData extends UserExistInterface {
  @override
  Future<bool> call(String username) async {
    sqflite.Database database = await Database().getDatabase();

    const _selectUser = '''
      SELECT 
        ID 
      FROM 
        USERS 
      WHERE 
        username = ?
      LIMIT 1
    ''';

    var id = -1;

    try {
      id = sqflite.Sqflite.firstIntValue(
        await database.rawQuery(
          _selectUser,
          [username],
        ),
      )!;

      // ignore: avoid_print
      print(id);
    } catch (_) {
      // ignore: avoid_print
      print(_);
    }

    await Database().closeDatabase();

    return id > 0;
  }
}
