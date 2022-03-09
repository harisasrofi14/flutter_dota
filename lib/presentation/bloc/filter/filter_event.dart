abstract class FilterEvent {}

class SetFilter extends FilterEvent {
  final String role;

  SetFilter(this.role);

  List<Object> get props => [role];
}

class OnGetFilters extends FilterEvent {
  @override
  List<Object?> get props => [];
}
