import 'package:dota/common/exception.dart';
import 'package:dota/data/models/filter_model.dart';
import 'package:dota/data/models/hero_table.dart';
import 'package:dota/data/models/roles_table.dart';

import 'db/hero_database_helper.dart';

abstract class HeroesLocalDataSource {
  Future<String> insertHeroes(HeroTable hero);

  Future<String> insertRoles(RolesTable role);

  Future<List<HeroTable>> getAllHeroes();

  Future<List<HeroTable>> getFilteredHeroes({filter = ''});

  Future<List<RolesTable>> getRoles(int id);

  Future<List<HeroFilter>> getFilters();

  Future<List<HeroTable>> getRecommendation(
      {int id, String primaryAttack, int limit});
}

class HeroesLocalDataSourceImpl implements HeroesLocalDataSource {
  final HeroDatabaseHelper databaseHelper;

  HeroesLocalDataSourceImpl({required this.databaseHelper});

  @override
  Future<String> insertHeroes(HeroTable hero) async {
    try {
      await databaseHelper.insertHeroes(hero);
      return 'Success';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<List<HeroTable>> getAllHeroes() async {
    try {
      final result = await databaseHelper.getAllHeroes();

      return result.map((data) => HeroTable.fromMap(data)).toList();
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<List<RolesTable>> getRoles(int id) async {
    try {
      final result = await databaseHelper.getHeroRoles(id);
      return result.map((data) => RolesTable.fromMap(data)).toList();
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> insertRoles(RolesTable role) async {
    try {
      await databaseHelper.insertRoles(role);
      return 'Success';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<List<HeroFilter>> getFilters() async {
    try {
      final result = await databaseHelper.getFilters();
      return result.map((data) => HeroFilter.fromMap(data)).toList();
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<List<HeroTable>> getRecommendation(
      {int id = 0, String primaryAttack = '', int limit = 0}) async {
    try {
      final result =
          await databaseHelper.getRecommendation(id, primaryAttack, limit);
      return result.map((data) => HeroTable.fromMap(data)).toList();
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<List<HeroTable>> getFilteredHeroes({filter = ''}) async {
    try {
      final result = await databaseHelper.getFilteredHeroes(filter);

      return result.map((data) => HeroTable.fromMap(data)).toList();
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }
}
