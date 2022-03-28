import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbUtil {
  static Future<Database> database() async {
    final dbPath = await getDatabasesPath();

    return openDatabase(
      join(dbPath, 'pets.db'),
      onCreate: (database, version) {
        _creatDb(database);
      },
      version: 1,
    );
  }

  static void _creatDb(Database database) {
    database.execute(""" 
    CREATE TABLE pets (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(50),
    imageUrl BLOB,
    descricao TEXT,
    idade INTEGER,
    sexo VARCHAR(8),
    cor VARCHAR(20),
    bio TEXT,
    peso REAL
    )
    """);
  }

  static Future<void> insertData(
      String table, Map<String, Object?> data) async {
    final db = await database();

    await db.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);
  }
}
