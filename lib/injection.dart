import 'package:dota/data/datasources/db/hero_database_helper.dart';
import 'package:dota/data/datasources/local_data_source.dart';
import 'package:dota/data/datasources/remote_data_source.dart';
import 'package:dota/data/repositories/hero_repository_impl.dart';
import 'package:dota/domain/repositories/hero_repository.dart';
import 'package:dota/domain/usecase/get_all_heroes.dart';
import 'package:dota/domain/usecase/get_filtered_heroes.dart';
import 'package:dota/domain/usecase/get_filters.dart';
import 'package:dota/domain/usecase/get_recommendation.dart';
import 'package:dota/presentation/bloc/filter/filter_bloc.dart';
import 'package:dota/presentation/bloc/heroes/heroes_bloc.dart';
import 'package:dota/presentation/bloc/recommendation/recommendation_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void init() {
  locator.registerFactory(
      () => HeroesBloc(getAllHeroes: locator(), getFilteredHeroes: locator()));
  locator.registerFactory(() => FilterBloc(getAllFilters: locator()));
  locator
      .registerFactory(() => RecommendationBloc(getRecommendation: locator()));

  locator.registerLazySingleton(() => GetAllHeroes(locator()));
  locator.registerLazySingleton(() => GetAllFilters(locator()));
  locator.registerLazySingleton(() => GetRecommendation(locator()));
  locator.registerLazySingleton(() => GetFilteredHeroes(locator()));

  locator.registerLazySingleton<HeroDatabaseHelper>(() => HeroDatabaseHelper());
  locator.registerLazySingleton<HeroRepository>(() => HeroRepositoryImpl(
      remoteDataSource: locator(), heroesLocalDataSource: locator()));

  locator.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(client: locator()));

  locator.registerLazySingleton<HeroesLocalDataSource>(
      () => HeroesLocalDataSourceImpl(databaseHelper: locator()));

  locator.registerLazySingleton(() => http.Client());
}
