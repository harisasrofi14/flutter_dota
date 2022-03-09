import 'package:equatable/equatable.dart';

abstract class HeroesEvent extends Equatable {
  const HeroesEvent();

  @override
  List<Object?> get props => [];
}

class OnGetAllHeroes extends HeroesEvent {
  @override
  List<Object?> get props => [];
}

class OnFilterHeroes extends HeroesEvent {
  final String filter;

  const OnFilterHeroes(this.filter);

  @override
  List<Object?> get props => [filter];
}
