import 'package:dartz/dartz.dart';
import 'package:dota/common/failure.dart';
import 'package:dota/domain/entities/filters.dart';
import 'package:dota/domain/repositories/hero_repository.dart';

class GetAllFilters {
  final HeroRepository repository;

  GetAllFilters(this.repository);

  Future<Either<Failure, List<Filters>>> execute() {
    return repository.getAllFilter();
  }
}
