import 'package:dota/domain/entities/filters.dart';
import 'package:equatable/equatable.dart';

class HeroFilter extends Equatable {
  final String filterTitle;

  const HeroFilter(this.filterTitle);

  factory HeroFilter.fromMap(Map<String, dynamic> map) {
    return HeroFilter(map['role']);
  }

  Filters toEntity() {
    return Filters(filterTitle, false);
  }

  @override
  List<Object?> get props => [filterTitle];
}
