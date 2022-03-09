import 'dart:convert';

import 'package:dota/common/exception.dart';
import 'package:dota/data/models/hero_model.dart';
import 'package:dota/data/models/hero_response.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future<List<HeroModel>> getAllHeroes();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;

  RemoteDataSourceImpl({required this.client});

  @override
  Future<List<HeroModel>> getAllHeroes() async {
    final response =
        await client.get(Uri.parse('https://api.opendota.com/api/herostats'));
    try {
      if (response.statusCode == 200) {
        return HeroResponse.fromJson(json.decode(response.body)).heroList;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
