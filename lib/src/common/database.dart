import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DataBase {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('coffeeshop.db');
    return _database!;
  }

  static Future<Database> _initDB(String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, fileName);

    final db = await openDatabase(path, version: 1, onCreate: _createDB);
    return db;
  }

  static Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE categories (
        id INTEGER,
        slug TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE products (
        id INTEGER,
        name TEXT,
        price REAL,
        image TEXT,
        categoryId INTEGER
      )
    ''');

    await db.execute('''
      CREATE TABLE locations (
        address TEXT,
        lat REAL,
        lng REAL
      )
    ''');
  }

  query(
    String s, {
    required String where,
    required List<String> whereArgs,
    required int limit,
    required int offset,
  }) {}
}
