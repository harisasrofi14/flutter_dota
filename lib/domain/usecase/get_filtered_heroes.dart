import 'package:dartz/dartz.dart';
import 'package:dota/common/failure.dart';
import 'package:dota/domain/entities/heroes.dart';
import 'package:dota/domain/repositories/hero_repository.dart';

class GetFilteredHeroes {
  final HeroRepository repository;

  GetFilteredHeroes(this.repository);

  Future<Either<Failure, List<Heroes>>> execute(filter) {
    return repository.getAllFilteredHeroes(filter);
  }
}
