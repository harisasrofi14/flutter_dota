// Mocks generated by Mockito 5.1.0 from annotations
// in dota/test/helper/test_helper.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;
import 'dart:convert' as _i17;
import 'dart:typed_data' as _i18;

import 'package:dartz/dartz.dart' as _i2;
import 'package:dota/common/failure.dart' as _i6;
import 'package:dota/data/datasources/db/hero_database_helper.dart' as _i15;
import 'package:dota/data/datasources/local_data_source.dart' as _i11;
import 'package:dota/data/datasources/remote_data_source.dart' as _i9;
import 'package:dota/data/models/filter_model.dart' as _i14;
import 'package:dota/data/models/hero_model.dart' as _i10;
import 'package:dota/data/models/hero_table.dart' as _i12;
import 'package:dota/data/models/roles_table.dart' as _i13;
import 'package:dota/domain/entities/filters.dart' as _i8;
import 'package:dota/domain/entities/heroes.dart' as _i7;
import 'package:dota/domain/repositories/hero_repository.dart' as _i4;
import 'package:http/http.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:sqflite/sqflite.dart' as _i16;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

class _FakeResponse_1 extends _i1.Fake implements _i3.Response {}

class _FakeStreamedResponse_2 extends _i1.Fake implements _i3.StreamedResponse {
}

/// A class which mocks [HeroRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockHeroRepository extends _i1.Mock implements _i4.HeroRepository {
  MockHeroRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.Either<_i6.Failure, List<_i7.Heroes>>> getAllHeroes() =>
      (super.noSuchMethod(Invocation.method(#getAllHeroes, []),
          returnValue: Future<_i2.Either<_i6.Failure, List<_i7.Heroes>>>.value(
              _FakeEither_0<_i6.Failure, List<_i7.Heroes>>())) as _i5
          .Future<_i2.Either<_i6.Failure, List<_i7.Heroes>>>);
  @override
  _i5.Future<_i2.Either<_i6.Failure, List<_i7.Heroes>>> getAllFilteredHeroes(
          String? filter) =>
      (super.noSuchMethod(Invocation.method(#getAllFilteredHeroes, [filter]),
          returnValue: Future<_i2.Either<_i6.Failure, List<_i7.Heroes>>>.value(
              _FakeEither_0<_i6.Failure, List<_i7.Heroes>>())) as _i5
          .Future<_i2.Either<_i6.Failure, List<_i7.Heroes>>>);
  @override
  _i5.Future<_i2.Either<_i6.Failure, List<_i8.Filters>>> getAllFilter() =>
      (super.noSuchMethod(Invocation.method(#getAllFilter, []),
          returnValue: Future<_i2.Either<_i6.Failure, List<_i8.Filters>>>.value(
              _FakeEither_0<_i6.Failure, List<_i8.Filters>>())) as _i5
          .Future<_i2.Either<_i6.Failure, List<_i8.Filters>>>);
  @override
  _i5.Future<_i2.Either<_i6.Failure, List<_i7.Heroes>>> getRecommendation(
          int? id, String? primaryAttack, int? limit) =>
      (super.noSuchMethod(
          Invocation.method(#getRecommendation, [id, primaryAttack, limit]),
          returnValue: Future<_i2.Either<_i6.Failure, List<_i7.Heroes>>>.value(
              _FakeEither_0<_i6.Failure, List<_i7.Heroes>>())) as _i5
          .Future<_i2.Either<_i6.Failure, List<_i7.Heroes>>>);
}

/// A class which mocks [RemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoteDataSource extends _i1.Mock implements _i9.RemoteDataSource {
  MockRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<List<_i10.HeroModel>> getAllHeroes() => (super.noSuchMethod(
          Invocation.method(#getAllHeroes, []),
          returnValue: Future<List<_i10.HeroModel>>.value(<_i10.HeroModel>[]))
      as _i5.Future<List<_i10.HeroModel>>);
}

/// A class which mocks [HeroesLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockHeroesLocalDataSource extends _i1.Mock
    implements _i11.HeroesLocalDataSource {
  MockHeroesLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<String> insertHeroes(_i12.HeroTable? hero) =>
      (super.noSuchMethod(Invocation.method(#insertHeroes, [hero]),
          returnValue: Future<String>.value('')) as _i5.Future<String>);
  @override
  _i5.Future<String> insertRoles(_i13.RolesTable? role) =>
      (super.noSuchMethod(Invocation.method(#insertRoles, [role]),
          returnValue: Future<String>.value('')) as _i5.Future<String>);
  @override
  _i5.Future<List<_i12.HeroTable>> getAllHeroes() => (super.noSuchMethod(
          Invocation.method(#getAllHeroes, []),
          returnValue: Future<List<_i12.HeroTable>>.value(<_i12.HeroTable>[]))
      as _i5.Future<List<_i12.HeroTable>>);
  @override
  _i5.Future<List<_i12.HeroTable>> getFilteredHeroes({dynamic filter = r''}) =>
      (super.noSuchMethod(
              Invocation.method(#getFilteredHeroes, [], {#filter: filter}),
              returnValue:
                  Future<List<_i12.HeroTable>>.value(<_i12.HeroTable>[]))
          as _i5.Future<List<_i12.HeroTable>>);
  @override
  _i5.Future<List<_i13.RolesTable>> getRoles(int? id) => (super.noSuchMethod(
          Invocation.method(#getRoles, [id]),
          returnValue: Future<List<_i13.RolesTable>>.value(<_i13.RolesTable>[]))
      as _i5.Future<List<_i13.RolesTable>>);
  @override
  _i5.Future<List<_i14.HeroFilter>> getFilters() => (super.noSuchMethod(
          Invocation.method(#getFilters, []),
          returnValue: Future<List<_i14.HeroFilter>>.value(<_i14.HeroFilter>[]))
      as _i5.Future<List<_i14.HeroFilter>>);
  @override
  _i5.Future<List<_i12.HeroTable>> getRecommendation(
          {int? id, String? primaryAttack, int? limit}) =>
      (super.noSuchMethod(
              Invocation.method(#getRecommendation, [],
                  {#id: id, #primaryAttack: primaryAttack, #limit: limit}),
              returnValue:
                  Future<List<_i12.HeroTable>>.value(<_i12.HeroTable>[]))
          as _i5.Future<List<_i12.HeroTable>>);
}

/// A class which mocks [HeroDatabaseHelper].
///
/// See the documentation for Mockito's code generation for more information.
class MockHeroDatabaseHelper extends _i1.Mock
    implements _i15.HeroDatabaseHelper {
  MockHeroDatabaseHelper() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i16.Database?> get database =>
      (super.noSuchMethod(Invocation.getter(#database),
              returnValue: Future<_i16.Database?>.value())
          as _i5.Future<_i16.Database?>);
  @override
  _i5.Future<int> insertHeroes(_i12.HeroTable? heroTable) =>
      (super.noSuchMethod(Invocation.method(#insertHeroes, [heroTable]),
          returnValue: Future<int>.value(0)) as _i5.Future<int>);
  @override
  _i5.Future<int> insertRoles(_i13.RolesTable? rolesTable) =>
      (super.noSuchMethod(Invocation.method(#insertRoles, [rolesTable]),
          returnValue: Future<int>.value(0)) as _i5.Future<int>);
  @override
  _i5.Future<List<Map<String, dynamic>>> getAllHeroes() => (super.noSuchMethod(
      Invocation.method(#getAllHeroes, []),
      returnValue: Future<List<Map<String, dynamic>>>.value(
          <Map<String, dynamic>>[])) as _i5.Future<List<Map<String, dynamic>>>);
  @override
  _i5.Future<List<Map<String, dynamic>>> getFilteredHeroes(String? filter) =>
      (super.noSuchMethod(Invocation.method(#getFilteredHeroes, [filter]),
              returnValue: Future<List<Map<String, dynamic>>>.value(
                  <Map<String, dynamic>>[]))
          as _i5.Future<List<Map<String, dynamic>>>);
  @override
  _i5.Future<List<Map<String, dynamic>>> getHeroRoles(int? id) =>
      (super.noSuchMethod(Invocation.method(#getHeroRoles, [id]),
              returnValue: Future<List<Map<String, dynamic>>>.value(
                  <Map<String, dynamic>>[]))
          as _i5.Future<List<Map<String, dynamic>>>);
  @override
  _i5.Future<List<Map<String, dynamic>>> getFilters() => (super.noSuchMethod(
      Invocation.method(#getFilters, []),
      returnValue: Future<List<Map<String, dynamic>>>.value(
          <Map<String, dynamic>>[])) as _i5.Future<List<Map<String, dynamic>>>);
  @override
  _i5.Future<List<Map<String, dynamic>>> getRecommendation(
          int? id, String? primaryAttack, int? limit) =>
      (super.noSuchMethod(
              Invocation.method(#getRecommendation, [id, primaryAttack, limit]),
              returnValue: Future<List<Map<String, dynamic>>>.value(
                  <Map<String, dynamic>>[]))
          as _i5.Future<List<Map<String, dynamic>>>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i3.Client {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i3.Response> head(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#head, [url], {#headers: headers}),
              returnValue: Future<_i3.Response>.value(_FakeResponse_1()))
          as _i5.Future<_i3.Response>);
  @override
  _i5.Future<_i3.Response> get(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#get, [url], {#headers: headers}),
              returnValue: Future<_i3.Response>.value(_FakeResponse_1()))
          as _i5.Future<_i3.Response>);
  @override
  _i5.Future<_i3.Response> post(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i17.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#post, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i3.Response>.value(_FakeResponse_1()))
          as _i5.Future<_i3.Response>);
  @override
  _i5.Future<_i3.Response> put(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i17.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#put, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i3.Response>.value(_FakeResponse_1()))
          as _i5.Future<_i3.Response>);
  @override
  _i5.Future<_i3.Response> patch(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i17.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#patch, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i3.Response>.value(_FakeResponse_1()))
          as _i5.Future<_i3.Response>);
  @override
  _i5.Future<_i3.Response> delete(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i17.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#delete, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i3.Response>.value(_FakeResponse_1()))
          as _i5.Future<_i3.Response>);
  @override
  _i5.Future<String> read(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#read, [url], {#headers: headers}),
          returnValue: Future<String>.value('')) as _i5.Future<String>);
  @override
  _i5.Future<_i18.Uint8List> readBytes(Uri? url,
          {Map<String, String>? headers}) =>
      (super.noSuchMethod(
              Invocation.method(#readBytes, [url], {#headers: headers}),
              returnValue: Future<_i18.Uint8List>.value(_i18.Uint8List(0)))
          as _i5.Future<_i18.Uint8List>);
  @override
  _i5.Future<_i3.StreamedResponse> send(_i3.BaseRequest? request) =>
      (super.noSuchMethod(Invocation.method(#send, [request]),
              returnValue:
                  Future<_i3.StreamedResponse>.value(_FakeStreamedResponse_2()))
          as _i5.Future<_i3.StreamedResponse>);
  @override
  void close() => super.noSuchMethod(Invocation.method(#close, []),
      returnValueForMissingStub: null);
}
