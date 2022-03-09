import 'package:dartz/dartz.dart';
import 'package:dota/common/failure.dart';
import 'package:dota/domain/entities/heroes.dart';
import 'package:dota/domain/repositories/hero_repository.dart';

class GetRecommendation {
  final HeroRepository repository;

  GetRecommendation(this.repository);

  Future<Either<Failure, List<Heroes>>> execute(id, primaryAttack, limit) {
    return repository.getRecommendation(id, primaryAttack, limit);
  }
}
