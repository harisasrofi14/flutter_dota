import 'package:dota/common/exception.dart';
import 'package:dota/data/datasources/local_data_source.dart';
import 'package:dota/data/models/filter_model.dart';
import 'package:dota/data/models/hero_table.dart';
import 'package:dota/data/models/roles_table.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_object.dart';
import '../../helper/test_helper.mocks.dart';

void main() {
  late HeroesLocalDataSourceImpl dataSourceImpl;
  late MockHeroDatabaseHelper mockDatabaseHelper;

  setUp(() {
    mockDatabaseHelper = MockHeroDatabaseHelper();
    dataSourceImpl =
        HeroesLocalDataSourceImpl(databaseHelper: mockDatabaseHelper);
  });

  group('Insert Heroes', () {
    test('should return success message when insert to database is success',
        () async {
      when(mockDatabaseHelper.insertHeroes(testHeroTable))
          .thenAnswer((_) async => 1);
      // act
      final result = await dataSourceImpl.insertHeroes(testHeroTable);
      // assert
      expect(result, 'Success');
    });
    test('should throw DatabaseException when insert to database is failed',
        () async {
      // arrange
      when(mockDatabaseHelper.insertHeroes(testHeroTable))
          .thenThrow(Exception());
      // act
      final call = dataSourceImpl.insertHeroes(testHeroTable);
      // assert
      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });

  group('getAllHeroes', () {
    test('should return all data from db', () async {
      when(mockDatabaseHelper.getAllHeroes())
          .thenAnswer((_) async => listTableMap);
      var r = listTableMap.map((data) => HeroTable.fromMap(data)).toList();
      final result = await dataSourceImpl.getAllHeroes();
      expect(result, r);
    });
  });

  group('getRoles', () {
    test('should return roles by hero id', () async {
      when(mockDatabaseHelper.getHeroRoles(1))
          .thenAnswer((_) async => testListRoleTable);
      var r =
          testListRoleTable.map((data) => RolesTable.fromMap(data)).toList();
      final result = await dataSourceImpl.getRoles(1);
      expect(result, r);
    });
  });

  group('getFilters', () {
    test('should return distinct filters by roles', () async {
      when(mockDatabaseHelper.getFilters())
          .thenAnswer((_) async => testListHeroFilter);
      final result = await dataSourceImpl.getFilters();
      var r =
          testListHeroFilter.map((data) => HeroFilter.fromMap(data)).toList();
      expect(result, r);
    });
  });
}
