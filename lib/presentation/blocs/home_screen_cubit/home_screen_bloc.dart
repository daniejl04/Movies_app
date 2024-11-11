 import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:movies_test/config/helpers/getMoviesApi.dart';
 import 'package:movies_test/presentation/blocs/home_screen_cubit/home_screen_event.dart';
 import 'package:movies_test/presentation/blocs/home_screen_cubit/home_screen_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MoviesApi moviesApi;

  MovieBloc(this.moviesApi) : super(MovieInitial()) {
    on<LoadMovies>(_onLoadMovies);
  }

  Future<void> _onLoadMovies(
      LoadMovies event, Emitter<MovieState> emit) async {
    emit(MovieLoading());
    try {
      final nowPlayingMovies = await moviesApi.getMovies();
      final topRatedMovies = await moviesApi.getMoviesTop();
      emit(MovieLoaded(
        nowPlayingMovies: nowPlayingMovies,
        topRatedMovies: topRatedMovies,
      ));
    } catch (e) {
      emit(MovieError('Error loading movies: $e'));
    }
  }
}


