import 'package:sqflite/sqflite.dart';
import 'package:unicef/unicef/models/chart.dart';
import 'package:unicef/unicef/repository/database_connection.dart';
import 'package:unicef/unicef/widgets/CheckBoxState.dart';

class Repository {
  DataBaseConnecton? _dataBaseConnecton;

  Repository() {
    _dataBaseConnecton = DataBaseConnecton();
  }

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _dataBaseConnecton!.setDatabase();
    return _database!;
  }

  Future save(table, data) async {
    var conn = await database;
    return conn.insert(table, data);
  }

  Future getData(table) async {
    var conn = await database;
    var getData = await conn.query(table);
    return getData;
  }

  Future<List<CheckBoxState>> getDataById(table, column_name, id) async {
    var conn = await database;

    var data =
        await conn.query(table, where: '$column_name=?', whereArgs: [id]);
    var mapped =
        data.map((chart) => new CheckBoxState.fromJson(chart)).toList();
    return mapped;
  }

  Future<List> getCharts(table, column_name, ids) async {
    var conn = await database;
    List li = [];
    // var data = await conn.query(table,
    //     where: "indicator_id IN (${List.filled(ids.length, '?').join(',')})",
    //     whereArgs: ids);

    ids.forEach((element) async {
      var value = await conn
          .query(table, where: '$column_name=?', whereArgs: [element]);
      var mapped = value.map((chart) => new Chart.fromJson(chart));
      li.add(mapped);
    });

    return li;
  }

  deleteAllData() async {
    try {
      await _database!.transaction((txn) async {
        var batch = txn.batch();
        batch.delete("clusters");
        batch.delete("indicators");
        batch.delete("charts");
        batch.delete("introduction");
        batch.delete("survey");
        batch.delete("credits");
        batch.delete("demography");
        await batch.commit();
      });
    } catch (error) {
      throw Exception('DbBase.cleanDatabase: ' + error.toString());
    }
  }
}
