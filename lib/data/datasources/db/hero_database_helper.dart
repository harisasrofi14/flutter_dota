import 'package:dota/data/models/hero_table.dart';
import 'package:dota/data/models/roles_table.dart';
import 'package:sqflite/sqflite.dart';

class HeroDatabaseHelper {
  static HeroDatabaseHelper? _databaseHelper;

  HeroDatabaseHelper._instance() {
    _databaseHelper = this;
  }

  factory HeroDatabaseHelper() =>
      _databaseHelper ?? HeroDatabaseHelper._instance();

  static Database? _database;

  Future<Database?> get database async {
    _database = await _initDb();
    return _database;
  }

  static const String _tblHeroes = 'heroes';
  static const String _tblRoles = 'roles';

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/dota.db';

    var db = await openDatabase(databasePath, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE  $_tblHeroes (
        id INTEGER PRIMARY KEY,
        localized_name TEXT,
        primary_attr TEXT,
        img TEXT,
        icon TEXT,
        attack_type TEXT,
        base_health INTEGER,
        base_attack_min INTEGER,
        base_attack_max INTEGER,
        move_speed INTEGER,
        base_mana INTEGER
      );
      CREATE UNIQUE INDEX idx_heroes
      ON heroes (rowid);
    ''');

    await db.execute('''
      CREATE TABLE  $_tblRoles (
        id INTEGER ,
        role TEXT
      );
    ''');
  }

  Future<int> insertHeroes(HeroTable heroTable) async {
    final db = await database;
    return await db!.insert(_tblHeroes, heroTable.toJson());
  }

  Future<int> insertRoles(RolesTable rolesTable) async {
    final db = await database;
    return await db!.insert(_tblRoles, rolesTable.toJson());
  }

  Future<List<Map<String, dynamic>>> getAllHeroes() async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db!.query(_tblHeroes);

    return results;
  }

  Future<List<Map<String, dynamic>>> getFilteredHeroes(String filter) async {
    final db = await database;

    final results = await db!.rawQuery(
        "SELECT A.* FROM $_tblHeroes A INNER JOIN $_tblRoles B ON A.id = B.id"
        " WHERE B.role IN ('$filter') GROUP BY A.localized_name ");

    return results;
  }

  Future<List<Map<String, dynamic>>> getHeroRoles(int id) async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db!.query(
      _tblRoles,
      where: 'id = ?',
      whereArgs: [id],
    );
    return results;
  }

  Future<List<Map<String, dynamic>>> getFilters() async {
    final db = await database;
    final List<Map<String, dynamic>> results =
        await db!.rawQuery("SELECT role FROM $_tblRoles GROUP BY role");
    return results;
  }

  Future<List<Map<String, dynamic>>> getRecommendation(
      int id, String primaryAttack, int limit) async {
    final db = await database;
    List<Map<String, dynamic>> results = [];
    results = await db!.rawQuery(
        "SELECT * FROM $_tblHeroes WHERE id != $id AND primary_attr = '$primaryAttack' "
        "ORDER BY "
        "CASE 'primary_attr' "
        "WHEN 'agi' THEN move_speed "
        "WHEN 'str' THEN base_attack_max "
        "WHEN 'int' THEN base_mana END DESC "
        "LIMIT $limit");
    return results;
  }
}
