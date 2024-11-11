import 'package:movies_test/domain/entities/movie.entity.dart';
 
Future<List<Movie>> mockNowPlayingMovies() async {
  return [movie1, movie2]; 
}

Future<List<Movie>> mockTopRatedMovies() async {
  return [movie2];  
}

final movie1 = Movie(
  adult: false,
  backdropPath: '/path_to_backdrop.jpg',
  genreIds: [1, 2, 3],
  id: 101,
  originalLanguage: 'en',
  originalTitle: 'Original Movie 1',
  overview: 'This is a test movie description.',
  popularity: 7.5,
  posterPath: '/path_to_poster.jpg',
  releaseDate: DateTime(2024, 11, 11),
  title: 'Movie Title 1',
  video: false,
  voteAverage: 8.0,
  voteCount: 1200,
);

final movie2 = Movie(
  adult: false,
  backdropPath: '/path_to_backdrop_2.jpg',
  genreIds: [4, 5, 6],
  id: 102,
  originalLanguage: 'es',
  originalTitle: 'Original Movie 2',
  overview: 'This is another test movie description.',
  popularity: 8.5,
  posterPath: '/path_to_poster_2.jpg',
  releaseDate: DateTime(2024, 10, 20),
  title: 'Movie Title 2',
  video: false,
  voteAverage: 9.0,
  voteCount: 2000,
);
