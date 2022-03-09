import 'package:dota/domain/usecase/get_all_heroes.dart';
import 'package:dota/domain/usecase/get_filtered_heroes.dart';
import 'package:dota/presentation/bloc/heroes/heroes_event.dart';
import 'package:dota/presentation/bloc/heroes/heroes_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeroesBloc extends Bloc<HeroesEvent, HeroesState> {
  final GetAllHeroes getAllHeroes;
  final GetFilteredHeroes getFilteredHeroes;

  HeroesBloc({required this.getAllHeroes, required this.getFilteredHeroes})
      : super(HeroesEmpty()) {
    on<OnGetAllHeroes>((event, emit) async {
      emit(HeroesLoading());
      final result = await getAllHeroes.execute();
      result.fold((failure) {
        emit(HeroesError(failure.message));
      }, (r) {
        emit(HeroesHasData(r));
      });
    });

    on<OnFilterHeroes>((event, emit) async {
      emit(HeroesLoading());
      final result = await getFilteredHeroes.execute(event.filter);
      result.fold((failure) {
        emit(HeroesError(failure.message));
      }, (r) {
        emit(HeroesHasData(r));
      });
    });
  }
}
