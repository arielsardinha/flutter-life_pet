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

    database.execute("""
      CREATE TABLE remedios (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome VARCHAR(50),
        data INTEGER,
        petId INTEGER,
        FOREIGN KEY (petId) REFERENCES pets (id) ON DELETE NO ACTION ON UPDATE NO ACTION
      )
    """);
  }

  static Future<void> insertData(String tabela,
      {required Map<String, Object?> data}) async {
    final db = await database();

    await db.insert(tabela, data, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> getData() async {
    final db = await database();
    return db.query('pets');
  }

  // SELECT * FROM pets WHERE id=1
  static Future<List<Map<String, dynamic>>> getDataId(
    String tabela, {
    required List<Object?> whereArgs,
    required List<String> colunas,
    required String where,
  }) async {
    final db = await database();

    final response =
        db.query(tabela, columns: colunas, where: where, whereArgs: whereArgs);

    return response;
  }

  static Future<void> editData({
    required Map<String, Object?> data,
    required List<Object?> whereArgs,
  }) async {
    final db = await database();

    await db.update('pets', data, where: 'id = ?', whereArgs: whereArgs);
  }
}
