import 'package:dota/data/datasources/db/hero_database_helper.dart';
import 'package:dota/data/datasources/local_data_source.dart';
import 'package:dota/data/datasources/remote_data_source.dart';
import 'package:dota/domain/repositories/hero_repository.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

@GenerateMocks([
  HeroRepository,
  RemoteDataSource,
  HeroesLocalDataSource,
  HeroDatabaseHelper,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
