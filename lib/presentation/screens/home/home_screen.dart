import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_test/presentation/blocs/theme_dart_light/theme_cubit.dart';
import 'package:movies_test/presentation/blocs/blocs.dart';
import 'package:movies_test/presentation/widget/card_movies.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final themeCubit = BlocProvider.of<ThemeCubit>(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () => themeCubit.toggleTheme(),
              style: ButtonStyle(
                elevation: WidgetStateProperty.all(0),
                backgroundColor: WidgetStateProperty.all(Colors.transparent),
                shape: WidgetStateProperty.all(const CircleBorder()),
                padding: WidgetStateProperty.all(EdgeInsets.zero),
              ),
              child: Icon(
                context.watch<ThemeCubit>().state.isDarkmode
                    ? Icons.wb_sunny_outlined
                    : Icons.mode_night_outlined,
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                decoration: BoxDecoration(color: theme.colorScheme.primary),
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'Hello, what do you want to watch ?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: size.height * 0.04,
                      child: TextFormField(
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: "Search",
                          labelStyle: const TextStyle(color: Colors.white),
                          prefixIcon:
                              const Icon(Icons.search, color: Colors.white),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.10),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: size.height * 0.2,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                height: size.height,
                decoration: BoxDecoration(
                  color: theme.colorScheme.secondary,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: BlocBuilder<MovieBloc, MovieState>(
                          builder: (context, state) {
                            if (state is MovieLoading) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else if (state is MovieLoaded) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'RECOMMENDED FOR YOU',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.34,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: state.nowPlayingMovies.length,
                                      itemBuilder: (context, index) {
                                        final movie =
                                            state.nowPlayingMovies[index];
                                        return CardsMovies(movie: movie);
                                      },
                                    ),
                                  ),
                                  Text(
                                    'TOP RATED',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.34,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: state.topRatedMovies.length,
                                      itemBuilder: (context, index) {
                                        final movie =
                                            state.topRatedMovies[index];
                                        return CardsMovies(movie: movie);
                                      },
                                    ),
                                  ),
                                ],
                              );
                            } else if (state is MovieError) {
                              return Center(
                                child: Text(
                                  'Error: ${state.message}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              );
                            } else {
                              return const Center(
                                child: Text(
                                  'Something went wrong',
                                  style: TextStyle(color: Colors.white),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
