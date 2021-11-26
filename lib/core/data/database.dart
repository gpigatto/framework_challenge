import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:path/path.dart';

const databaseName = 'database.db';
const databaseVersion = 1;

class Database {
  Future<sqflite.Database> getDatabase() async {
    var databasesPath = await sqflite.getDatabasesPath();
    String path = join(databasesPath, databaseName);

    const _createUserTable = '''
      CREATE TABLE USERS (
        id INTEGER PRIMARY KEY, 
        username TEXT, 
        pin TEXT
      )
    ''';

    sqflite.Database database = await sqflite.openDatabase(
      path,
      version: databaseVersion,
      onCreate: (sqflite.Database db, int version) async {
        await db.execute(_createUserTable);
      },
    );

    return database;
  }

  Future<void> closeDatabase() async {
    var databasesPath = await sqflite.getDatabasesPath();
    String path = join(databasesPath, databaseName);

    sqflite.Database database = await sqflite.openDatabase(
      path,
      version: databaseVersion,
    );

    await database.close();
  }
}
