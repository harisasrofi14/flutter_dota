import 'package:dota/domain/usecase/get_recommendation.dart';
import 'package:dota/presentation/bloc/recommendation/recommendation_event.dart';
import 'package:dota/presentation/bloc/recommendation/recommendation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecommendationBloc
    extends Bloc<RecommendationEvent, RecommendationState> {
  final GetRecommendation getRecommendation;

  RecommendationBloc({required this.getRecommendation})
      : super(RecommendationEmpty()) {
    on<OnGetRecommendation>((event, emit) async {
      emit(RecommendationLoading());
      final result = await getRecommendation.execute(
          event.id, event.primaryAttack, event.limit);
      result.fold((failure) {
        emit(RecommendationError(failure.message));
      }, (r) {
        emit(RecommendationHasData(r));
      });
    });
  }
}
