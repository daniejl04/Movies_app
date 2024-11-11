import 'package:movies_test/presentation/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:movies_test/config/config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const BlocsProvider());
} 

class BlocsProvider extends StatelessWidget {
  const BlocsProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MovieBloc(MoviesApi())
            ..add(LoadMovies()), 
          lazy: false, 
        ),
        BlocProvider(
          create: (_) => CreditBloc(MoviesApi()),
        ),
        BlocProvider(
          create: (_) => DetailsBloc(MoviesApi()),
        ),
        BlocProvider(
          create: (context) => RouterSimpleCubit(), lazy: true,
        ),
        BlocProvider(
          create: (context) => ThemeCubit(), lazy: true,
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

  final appRauterBloc = context.watch<RouterSimpleCubit>().state;
  final themeCubit = context.watch<ThemeCubit>().state;

    return MaterialApp.router(
      title: 'Movies',
      debugShowCheckedModeBanner: false,
      routerConfig: appRauterBloc,
      theme: AppTheme(isDarkmode: themeCubit.isDarkmode).getTheme(),
    );
  }
}
