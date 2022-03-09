import 'package:dota/domain/entities/filters.dart';
import 'package:dota/domain/usecase/get_filters.dart';
import 'package:dota/presentation/bloc/filter/filter_event.dart';
import 'package:dota/presentation/bloc/filter/filter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  final GetAllFilters getAllFilters;

  FilterBloc({required this.getAllFilters}) : super(FilterEmpty()) {
    List<Filters> filters = [];
    on<OnGetFilters>((event, emit) async {
      emit((FilterLoading()));
      if (filters.isEmpty) {
        final result = await getAllFilters.execute();
        result.fold((failure) {
          emit(FilterError());
        }, (r) {
          filters.addAll(r);
          emit(FilterHasData(filters));
        });
      } else {
        emit(FilterHasData(filters));
      }
    });
    on<SetFilter>((event, emit) async {
      String role = event.role;
      final tile = filters.firstWhere((item) => item.filterTitle == role);
      tile.isSelected = !tile.isSelected;
    });
  }
}
