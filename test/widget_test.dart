import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies_test/config/helpers/getMoviesApi.dart';
import 'package:movies_test/presentation/blocs/home_screen_cubit/home_screen_event.dart';
import 'package:movies_test/presentation/blocs/home_screen_cubit/home_screen_state.dart';
import 'package:movies_test/presentation/blocs/home_screen_cubit/home_screen_bloc.dart';

class MockMoviesApi extends Mock implements MoviesApi {}

void main() {
  late MockMoviesApi mockMoviesApi;
  late MovieBloc movieBloc;

  setUp(() {
    mockMoviesApi = MockMoviesApi();
    movieBloc = MovieBloc(mockMoviesApi);
  });

  tearDown(() {
    movieBloc.close();
  });

  group('MovieBloc', () {
    test('initial state is MovieInitial', () {
      expect(movieBloc.state, equals(MovieInitial()));
    });

// blocTest<MovieBloc, MovieState>(
//   'emits [MovieLoading, MovieLoaded] when movies are successfully fetched',
//   build: () {
//     when(() => mockMoviesApi.getMovies())
//         .thenAnswer((_) async =>  mockNowPlayingMovies);
//     when(() => mockMoviesApi.getMoviesTop())
//         .thenAnswer((_) async => mockTopRatedMovies);
//     return movieBloc;
//   },
//   act: (bloc) => bloc.add(LoadMovies()),
//   expect: () => [
//     MovieLoading(),
//     MovieLoaded(
//       nowPlayingMovies: mockNowPlayingMovies, 
//       topRatedMovies: mockTopRatedMovies ,
//     ),
//   ],
//   verify: (_) {
//     verify(() => mockMoviesApi.getMovies()).called(1);
//     verify(() => mockMoviesApi.getMoviesTop()).called(1);
//   },
// );


    blocTest<MovieBloc, MovieState>(
  'emits [MovieLoading, MovieError] when an exception is thrown',
  build: () {
    when(() => mockMoviesApi.getMovies())
        .thenThrow(Exception('Error fetching movies'));
    return movieBloc;
  },
  act: (bloc) => bloc.add(LoadMovies()),
  expect: () => [
    isA<MovieLoading>(),
    isA<MovieError>(),
  ],
  verify: (_) {
    verify(() => mockMoviesApi.getMovies()).called(1);
  },
);
  });
}
