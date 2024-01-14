import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._internal();
  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    // Specify the database path
    String path = await getDatabasesPath();
    return await openDatabase(join(path, 'Tani_Yuk.db'),
        onCreate: _createDb, version: 1);
  }

  Future _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE products (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        description TEXT,
        price TEXT,
        imagePath TEXT
      )
    ''');
  }

  // ... functions to insert, query, update, and delete products
}
