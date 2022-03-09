import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dota/common/exception.dart';
import 'package:dota/common/failure.dart';
import 'package:dota/data/repositories/hero_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_object.dart';
import '../../helper/test_helper.mocks.dart';

void main() {
  late HeroRepositoryImpl heroRepositoryImpl;
  late MockRemoteDataSource mockRemoteDataSource;
  late MockHeroesLocalDataSource mockHeroesLocalDataSource;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockHeroesLocalDataSource = MockHeroesLocalDataSource();
    heroRepositoryImpl = HeroRepositoryImpl(
        remoteDataSource: mockRemoteDataSource,
        heroesLocalDataSource: mockHeroesLocalDataSource);
  });

  group('getAllHeroes', () {
    test('should return local data ', () async {
      when(mockHeroesLocalDataSource.getAllHeroes())
          .thenAnswer((_) async => testListHeroTable);
      when(mockRemoteDataSource.getAllHeroes())
          .thenAnswer((_) async => testListHero);
      when(mockHeroesLocalDataSource.getRoles(1))
          .thenAnswer((_) async => testHeroRoleTable);
      final result = await heroRepositoryImpl.getAllHeroes();
      verify(mockHeroesLocalDataSource.getAllHeroes());
      final resultList = result.getOrElse(() => []);
      expect(resultList, testListHeroes);
    });

    test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockHeroesLocalDataSource.getAllHeroes())
          .thenAnswer((_) async => []);
      when(mockRemoteDataSource.getAllHeroes()).thenThrow(ServerException());
      // act
      final result = await heroRepositoryImpl.getAllHeroes();
      // assert
      verify(mockRemoteDataSource.getAllHeroes());
      expect(result, equals(const Left(ServerFailure('Error Network'))));
    });

    test(
        'should return connection failure when the device is not connected to internet',
        () async {
      // arrange
      when(mockHeroesLocalDataSource.getAllHeroes())
          .thenAnswer((_) async => []);
      when(mockRemoteDataSource.getAllHeroes())
          .thenThrow(const SocketException('Failed to connect to the network'));
      // act
      final result = await heroRepositoryImpl.getAllHeroes();
      // assert
      verify(mockRemoteDataSource.getAllHeroes());
      expect(
          result,
          equals(const Left(
              ConnectionFailure('Failed to connect to the network'))));
    });
  });

  group('getAllFilteredHeroes', () {
    test('should return heroes by selected filters from local data ', () async {
      when(mockHeroesLocalDataSource.getFilteredHeroes(filter: 'Carry'))
          .thenAnswer((_) async => testListHeroTable);
      when(mockHeroesLocalDataSource.getRoles(1))
          .thenAnswer((_) async => testHeroRoleTable);
      final result = await heroRepositoryImpl.getAllFilteredHeroes('Carry');
      verify(mockHeroesLocalDataSource.getFilteredHeroes(filter: 'Carry'));
      final resultList = result.getOrElse(() => []);
      expect(resultList, testListHeroes);
    });
  });

  group('GetAllFilters', () {
    test('should return all filters from local data ', () async {
      when(mockHeroesLocalDataSource.getFilters())
          .thenAnswer((_) async => testListHeroFilters);

      final result = await heroRepositoryImpl.getAllFilter();
      verify(mockHeroesLocalDataSource.getFilters());
      final resultList = result.getOrElse(() => []);
      expect(resultList, testListFilters);
    });
  });

  group('GetRecommendations', () {
    test('should return Recommendation / Similar heroes ', () async {
      when(mockHeroesLocalDataSource.getRecommendation(
              id: 1, primaryAttack: 'agi', limit: 3))
          .thenAnswer((_) async => testListHeroTable);
      when(mockHeroesLocalDataSource.getRoles(1))
          .thenAnswer((_) async => testHeroRoleTable);
      final result = await heroRepositoryImpl.getRecommendation(1, 'agi', 3);
      verify(mockHeroesLocalDataSource.getRecommendation(
          id: 1, primaryAttack: 'agi', limit: 3));
      final resultList = result.getOrElse(() => []);
      expect(resultList, testListHeroes);
    });
  });
}
