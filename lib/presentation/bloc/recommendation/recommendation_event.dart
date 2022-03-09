import 'package:equatable/equatable.dart';

abstract class RecommendationEvent extends Equatable {
  const RecommendationEvent();

  @override
  List<Object?> get props => [];
}

class OnGetRecommendation extends RecommendationEvent {
  final int id;
  final String primaryAttack;
  final int limit;

  @override
  List<Object?> get props => [id];

  const OnGetRecommendation(
      {required this.id, required this.primaryAttack, required this.limit});
}
