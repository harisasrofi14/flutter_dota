import 'package:dartz/dartz.dart';
import 'package:dota/common/failure.dart';
import 'package:dota/domain/entities/heroes.dart';
import 'package:dota/domain/repositories/hero_repository.dart';

class GetAllHeroes {
  final HeroRepository repository;

  GetAllHeroes(this.repository);

  Future<Either<Failure, List<Heroes>>> execute() {
    return repository.getAllHeroes();
  }
}
