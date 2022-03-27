import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbUtil {
  static Future<Database> database() async {
    final dbPath = await getDatabasesPath();

    return openDatabase(
      join(dbPath, 'pets.db'),
      onCreate: (db, version) {},
      version: 1,
    );
  }
}
