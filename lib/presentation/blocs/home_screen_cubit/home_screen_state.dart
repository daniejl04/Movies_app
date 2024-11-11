import 'package:movies_test/domain/entities/movie.entity.dart';

abstract class MovieState {}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieLoaded extends MovieState {
  final List<Movie> nowPlayingMovies;
  final List<Movie> topRatedMovies;

  MovieLoaded({
    required this.nowPlayingMovies,
    required this.topRatedMovies,
  });
}

class MovieError extends MovieState {
  final String message;

  MovieError(this.message);
}
