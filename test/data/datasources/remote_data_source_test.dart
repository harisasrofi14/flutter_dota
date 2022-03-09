import 'dart:convert';

import 'package:dota/common/exception.dart';
import 'package:dota/data/datasources/remote_data_source.dart';
import 'package:dota/data/models/hero_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../../helper/test_helper.mocks.dart';
import '../../json_reader.dart';

void main() {
  late RemoteDataSourceImpl dataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = RemoteDataSourceImpl(client: mockHttpClient);
  });

  group('getAllHeroes', () {
    final tHeroesList =
        HeroResponse.fromJson(json.decode(readJson('dummy_data/heroes.json')))
            .heroList;
    test('should return list of Heroes when the response code is 200',
        () async {
      when(mockHttpClient
              .get(Uri.parse('https://api.opendota.com/api/herostats')))
          .thenAnswer((_) async =>
              http.Response(readJson('dummy_data/heroes.json'), 200));

      final result = await dataSource.getAllHeroes();

      expect(result, equals(tHeroesList));
    });
    test(
        'should throw a ServerException when the response code is 404 or other',
        () async {
      // arrange
      when(mockHttpClient
              .get(Uri.parse('https://api.opendota.com/api/herostats')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      // act
      final call = dataSource.getAllHeroes();
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });
}
