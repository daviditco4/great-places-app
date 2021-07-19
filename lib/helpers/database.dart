import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;

import '../models/place.dart';

class Database {
  static const placesTable = 'user_places';

  static Future<void> insert(String table, Map<String, dynamic> values) async {
    final dbPath = await sql.getDatabasesPath();
    final db = await sql.openDatabase(
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

    await db.insert(
      table,
      values,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }
}
