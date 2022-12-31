import 'dart:ffi';

import 'package:sqflite/sqflite.dart';

class Messages {

  Future<String> getPath() async {
    var databasePath = await getDatabasesPath();
    return "$databasePath/app.db";
  }

  Future<Database> init(String path) async {
    Database database = await openDatabase(path, version: 1,
        // onCreate is called if the database does not exist
        onCreate: (Database db, int version) async {
          await db.execute(
              'CREATE TABLE Messages (messageID INTEGER PRIMARY KEY, INDEX convoID INTEGER, content TEXT, time DATETIME, type TEXT)'
          );
        });
    return database;
  }

  void delete(String path) async {
    await deleteDatabase(path);
  }

  void addMessage(Database database, List values) async {
    await database.transaction((txn) async {
      int id = await txn.rawInsert(
        'INSERT INTO Messages(messageID, convoID, content, time, type) VALUES(?, ?, ?, ?, ?)',
        values
      );
    });
  }

  void updateMessage(Database database, String newContent, Int messageID) async {
    int count = await database.rawUpdate(
        'UPDATE Messages SET content = ? WHERE messageID = ?',
        [newContent, messageID]
    );
  }

  Future<List<Map>> getMessages(Database database, String parameter, Int value) async {
    List<Map> messages = await database.rawQuery(
        'SELECT * FROM Messages WHERE ? = ?',
      [parameter, value]
    );
    return messages;
  }

  Future<int> deleteMessages(Database database, String parameter, Int value) async {
    int count = await database.rawDelete(
      'DELETE FROM Messages WHERE ? = ?',
      [parameter, value]
    );
    return count;
  }

}


