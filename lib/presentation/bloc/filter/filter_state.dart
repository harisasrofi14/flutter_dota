import 'package:dota/domain/entities/filters.dart';
import 'package:equatable/equatable.dart';

abstract class FilterState extends Equatable {
  const FilterState();

  @override
  List<Object?> get props => [];
}

class FilterEmpty extends FilterState {}

class FilterLoading extends FilterState {}

class FilterHasData extends FilterState {
  final List<Filters> result;

  const FilterHasData(this.result);

  @override
  List<Object> get props => [result];
}

class FilterError extends FilterState {}
