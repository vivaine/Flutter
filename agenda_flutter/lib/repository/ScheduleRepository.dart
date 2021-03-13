import 'package:agenda_flutter/components/contact.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ScheduleRepository {
  static final ScheduleRepository _singleton = new ScheduleRepository();

  factory ScheduleRepository() {
    return _singleton;
  }

  static _dataBaseManager() async {
    final int versionDb = 1;
    final pathDatabase = await getDatabasesPath();
    final localDatabase = join(pathDatabase, "schedule.db");
    var database = await openDatabase(localDatabase, version: versionDb,
        onCreate: (db, versionDb) {
      String commands =
          "create table contacts(id integer primary key, name varchar, phoneNumber integer)";
      db.execute(commands);
    });
    return database;
  }

  static save(Contact contact) async {
    Database db = await _dataBaseManager();
    Map<String, dynamic> mapContact = {
      "name": contact.name,
      "phoneNumber": contact.phoneNumber
    };

    int id = await db.insert("contacts", mapContact);
  }
}
