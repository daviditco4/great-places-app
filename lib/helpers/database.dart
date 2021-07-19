import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;

import '../models/place.dart';

class Database {
  static const placesTable = 'user_places';

  static Future<sql.Database> _open() async {
    final dbPath = await sql.getDatabasesPath();

    return sql.openDatabase(
      path.join(dbPath, 'places.db'),
      version: 1,
      onCreate: (database, _) {
        return database.execute(
          'CREATE TABLE $placesTable('
          '${Place.idKey} TEXT PRIMARY KEY, '
          '${Place.ttlKey} TEXT, '
          '${Place.imgKey} TEXT'
          ')',
        );
      },
    );
  }

  static Future<void> insert(String tbl, Map<String, dynamic> vls) async {
    final db = await _open();
    await db.insert(tbl, vls, conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> get(String table) async {
    return (await _open()).query(table);
  }
}
