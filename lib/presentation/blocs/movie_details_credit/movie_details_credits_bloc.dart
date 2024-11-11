 import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:movies_test/config/helpers/getMoviesApi.dart';
import 'package:movies_test/presentation/blocs/movie_details_credit/movie_details_credits_event.dart';
import 'package:movies_test/presentation/blocs/movie_details_credit/movie_details_credits_state.dart';

class CreditBloc extends Bloc<CreditsEvent, CreditsState> {
  final MoviesApi moviesApi;

  CreditBloc(this.moviesApi) : super(CreditInitial()) {
    on<LoadCredits>(_onLoadCredits);
  }

  Future<void> _onLoadCredits(
      LoadCredits event, Emitter<CreditsState> emit) async {
    emit(CreditLoading());
    try {
      final nowPlayingCredits = await moviesApi.getCredit(event.movieId);
      emit(CreditLoaded(
        nowPlayingCredits: nowPlayingCredits,
      ));
    } catch (e) {
      emit(CreditError('Error loading movies: $e'));
    }
  }
}
