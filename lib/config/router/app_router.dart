import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_test/domain/entities/movie.entity.dart';
import 'package:movies_test/presentation/screens/screens.dart';

final _appRouterPublic = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/details',
    builder: (context, state) {
      final movie = state.extra as Movie;
      return MovieDetailsScreen(movie: movie);
    },
  ),
]);

class RouterSimpleCubit extends Cubit<GoRouter> {
  RouterSimpleCubit() : super(_appRouterPublic);

  void goBack() {
    state.pop('/');
  }

  void goDetails(BuildContext context, Movie movie) {
    context.push('/details', extra: movie);
  }
}
