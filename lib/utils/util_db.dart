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

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await database();
    return db.query(table);
  }

  // SELECT * FROM pets WHERE id=1
  static Future<List<Map<String, dynamic>>> getDataId(
      {required String table, required List<Object?> whereArgs}) async {
    const colunas = [
      'id',
      'nome',
      'idade',
      'imageUrl',
      'descricao',
      'sexo',
      'cor',
      'bio',
      'peso'
    ];

    final db = await database();

    final response = db.query(table,
        columns: colunas, where: 'id = ?', whereArgs: whereArgs);

    return response;
  }
}
