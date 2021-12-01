import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseConnecton {
  setDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, "unicef");
    var database = await openDatabase(path,
        version: 1, onCreate: _onCreatingDatabase, onConfigure: _onConfigure);
    return database;
  }

  _onCreatingDatabase(Database db, int version) async {
    await db.execute(
        "CREATE TABLE clusters(id INTEGER PRIMARY KEY,name TEXT,image TEXt)");
    await db.execute(
        "CREATE TABLE indicators(id INTEGER PRIMARY KEY,cluster_id INTEGER,name TEXT,chart_type TEXT,description TEXT)");
    await db.execute(
      "CREATE TABLE charts(id INTEGER PRIMARY KEY,indicator_id INTEGER,label TEXT,np DOUBLE,p1 DOUBLE,p2 DOUBLE,p3 DOUBLE,p4 DOUBLE,p5 DOUBLE,p6 DOUBLE,p7 DOUBLE,chart_type TEXT,name TEXT,description TEXT)",
    );
    await db.execute(
      "CREATE TABLE credits(id INTEGER PRIMARY KEY,section TEXT,title TEXT,description TEXT,address TEXT,phone_number TEXT,email TEXT,website TEXT)",
    );
    await db.execute(
      "CREATE TABLE introduction(introduction TEXT)",
    );

    await db.execute(
      "CREATE TABLE survey(survey TEXT)",
    );
    await db.execute(
      "CREATE TABLE demography(demography TEXT)",
    );
    await db.execute(
      "CREATE TABLE terms(terms TEXT)",
    );
    await db.execute(
      "CREATE TABLE policy(policy TEXT)",
    );
  }

  static Future _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }
}
