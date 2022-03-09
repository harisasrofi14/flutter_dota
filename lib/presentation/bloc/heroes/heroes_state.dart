import 'package:dota/domain/entities/heroes.dart';
import 'package:equatable/equatable.dart';

abstract class HeroesState extends Equatable {
  const HeroesState();

  @override
  List<Object?> get props => [];
}

class HeroesEmpty extends HeroesState {}

class HeroesLoading extends HeroesState {}

class HeroesError extends HeroesState {
  final String message;

  const HeroesError(this.message);

  @override
  List<Object> get props => [message];
}

class HeroesHasData extends HeroesState {
  final List<Heroes> result;

  const HeroesHasData(this.result);

  @override
  List<Object> get props => [result];
}
