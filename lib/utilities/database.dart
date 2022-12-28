import 'package:sqflite/sqflite.dart';

class TestDatabase {

  Future<String> getPath() async {
    var databasePath = await getDatabasesPath();
    return join(databasePath, 'app.db');
}

  Future<Database> init(String path) async {
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute(
              'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
        });
    return database;
  }

  void delete(String path) async {
    await deleteDatabase(path);
  }

  void insert() async {

  }

}


