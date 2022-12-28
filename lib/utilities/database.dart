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

  void insert(Database database) async {
    await database.transaction((txn) async {
      int id1 = await txn.rawInsert(
        'INSERT INTO Test(name, value, num) VALUES("some name", 1234, 456.789)'
      );
      print('Inserted: $id1');

      int id2 = await txn.rawInsert(
        'INSERT INTO Test(name, value, num) VALUES(?, ?, ?)',
          ['another name', 12345678, 3.1416]
      );
      print('Inserted: $id2');
    });
  }

  void update() async {

  }

}


