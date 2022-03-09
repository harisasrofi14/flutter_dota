import 'package:dartz/dartz.dart';
import 'package:dota/common/failure.dart';
import 'package:dota/domain/entities/filters.dart';
import 'package:dota/domain/entities/heroes.dart';

abstract class HeroRepository {
  Future<Either<Failure, List<Heroes>>> getAllHeroes();

  Future<Either<Failure, List<Heroes>>> getAllFilteredHeroes(String filter);

  Future<Either<Failure, List<Filters>>> getAllFilter();

  Future<Either<Failure, List<Heroes>>> getRecommendation(
      int id, String primaryAttack, int limit);
}
