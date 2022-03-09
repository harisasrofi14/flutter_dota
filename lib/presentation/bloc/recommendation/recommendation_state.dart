import 'package:dota/domain/entities/heroes.dart';
import 'package:equatable/equatable.dart';

abstract class RecommendationState extends Equatable {
  const RecommendationState();

  @override
  List<Object?> get props => [];
}

class RecommendationEmpty extends RecommendationState {}

class RecommendationLoading extends RecommendationState {}

class RecommendationError extends RecommendationState {
  final String message;

  const RecommendationError(this.message);
}

class RecommendationHasData extends RecommendationState {
  final List<Heroes> result;

  const RecommendationHasData(this.result);

  @override
  List<Object> get props => [result];
}
