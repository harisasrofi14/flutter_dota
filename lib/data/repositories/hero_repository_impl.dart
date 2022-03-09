import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dota/common/exception.dart';
import 'package:dota/common/failure.dart';
import 'package:dota/data/datasources/local_data_source.dart';
import 'package:dota/data/datasources/remote_data_source.dart';
import 'package:dota/data/models/hero_model.dart';
import 'package:dota/data/models/hero_table.dart';
import 'package:dota/data/models/roles_table.dart';
import 'package:dota/domain/entities/filters.dart';
import 'package:dota/domain/entities/heroes.dart';
import 'package:dota/domain/repositories/hero_repository.dart';

class HeroRepositoryImpl implements HeroRepository {
  final RemoteDataSource remoteDataSource;
  final HeroesLocalDataSource heroesLocalDataSource;

  HeroRepositoryImpl(
      {required this.remoteDataSource, required this.heroesLocalDataSource});

  @override
  Future<Either<Failure, List<Heroes>>> getAllHeroes() async {
    try {
      List<Heroes> heroes = [];
      var localHeroes = await heroesLocalDataSource.getAllHeroes();
      if (localHeroes.isEmpty) {
        final result = await remoteDataSource.getAllHeroes();
        await saveHeroes(result);
        localHeroes = await heroesLocalDataSource.getAllHeroes();
      }
      heroes = await parsingToHero(localHeroes);
      return Right(heroes);
    } on ServerException {
      return const Left(ServerFailure('Error Network'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    } on DatabaseException {
      return const Left(ConnectionFailure('Failed to load database'));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, List<Filters>>> getAllFilter() async {
    try {
      var result = await heroesLocalDataSource.getFilters();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure('Error Network'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    } on DatabaseException {
      return const Left(ConnectionFailure('Failed to load database'));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, List<Heroes>>> getRecommendation(
      int id, String primaryAttack, int limit) async {
    try {
      List<Heroes> heroes = [];
      var recommendation = await heroesLocalDataSource.getRecommendation(
          id: id, primaryAttack: primaryAttack, limit: limit);
      heroes = await parsingToHero(recommendation);
      return Right(heroes);
    } on DatabaseException {
      return const Left(ConnectionFailure('Failed to load database'));
    } catch (e) {
      rethrow;
    }
  }

  Future<void> saveHeroes(List<HeroModel> heroes) async {
    try {
      for (var value in heroes) {
        var hero = HeroTable.fromEntity(value);
        await heroesLocalDataSource.insertHeroes(hero);
        for (var role in value.roles) {
          var r = RolesTable.fromEntity(value.id, role);
          await heroesLocalDataSource.insertRoles(r);
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, List<Heroes>>> getAllFilteredHeroes(
      String filter) async {
    try {
      List<Heroes> heroes = [];
      var localHeroes =
          await heroesLocalDataSource.getFilteredHeroes(filter: filter);
      heroes = await parsingToHero(localHeroes);
      return Right(heroes);
    } on DatabaseException {
      return const Left(ConnectionFailure('Failed to load database'));
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Heroes>> parsingToHero(localHeroes) async {
    List<Heroes> heroes = [];
    try {
      for (var hero in localHeroes) {
        List<RolesTable> roles = await heroesLocalDataSource.getRoles(hero.id);
        List<String> r = List<String>.from(roles.map((x) => x.role));
        Heroes h = Heroes(
            id: hero.id,
            localizedName: hero.localizeName.toString(),
            img: hero.img.toString(),
            icon: hero.icon.toString(),
            baseHealth: hero.baseHealth,
            baseAttackMin: hero.baseAttackMin,
            baseAttackMax: hero.baseAttackMax,
            moveSpeed: hero.moveSpeed,
            attackType: hero.attackType,
            roles: r,
            primaryAttr: hero.primaryAttr,
            baseMana: hero.baseMana);
        heroes.add(h);
      }

      return heroes;
    } catch (e) {
      rethrow;
    }
  }
}
