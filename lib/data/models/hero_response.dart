import 'dart:convert';

import 'package:dota/data/models/hero_model.dart';
import 'package:equatable/equatable.dart';

class HeroResponse extends Equatable {
  final List<HeroModel> heroList;

  const HeroResponse({required this.heroList});

  factory HeroResponse.fromJson(List<dynamic> json) => HeroResponse(
        heroList:
            List<HeroModel>.from((json).map((x) => HeroModel.fromJson(x))),
      );

  String heroResponseToJson(List<HeroModel> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  @override
  List<Object> get props => [heroList];
}
