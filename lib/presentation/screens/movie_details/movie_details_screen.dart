import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movies_test/domain/domain.dart';
import 'package:movies_test/presentation/blocs/blocs.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailsScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    context.read<CreditBloc>().add(LoadCredits(movie.id));
    context.read<DetailsBloc>().add(LoadDetails(movie.id));

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: size.height * 0.4,
                width: double.infinity,
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.3,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(50),
              height: size.height,
              decoration: BoxDecoration(
                color: theme.colorScheme.secondary,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    movie.title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Watch'),
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                            theme.colorScheme.primary.withOpacity(0.3),
                          ),
                          foregroundColor: WidgetStateProperty.all(
                            Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                          height: 60,
                          child: RatingBar.builder(
                            itemSize: 14,
                            initialRating: movie.voteAverage,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 8,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ))
                    ],
                  ),
                  Text(
                    movie.overview,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w200),
                    maxLines: 9,
                  ),
                  const SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: BlocBuilder<CreditBloc, CreditsState>(
                      builder: (context, state) {
                        if (state is CreditLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (state is CreditLoaded) {
                          return Row(
                            children: state.nowPlayingCredits.map((credit) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 35, // Tamaño del avatar
                                      backgroundImage: credit.profilePath !=
                                              null
                                          ? NetworkImage(
                                              'https://image.tmdb.org/t/p/w200${credit.profilePath}',
                                            )
                                          : const AssetImage(
                                                  'assets/images/no_image.png')
                                              as ImageProvider,
                                      backgroundColor: Colors.grey[800],
                                    ),
                                    const SizedBox(height: 8),
                                    SizedBox(
                                      width: 70,
                                      child: Text(
                                        credit.name ?? 'Unknown',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          );
                        } else if (state is CreditError) {
                          return Text(
                            state.message,
                            style: const TextStyle(color: Colors.red),
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: BlocBuilder<DetailsBloc, DetailsState>(
                          builder: (context, state) {
                            if (state is DetailLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (state is DetailLoaded) {
                              return Column(
                                children: [
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Gender',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(width: 25,),
                                        Wrap(
                                          spacing: 8.0,
                                          children: state.details.genres.map((genre) {
                                            return 
                                               Text(
                                                genre.name,
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              );
                                            
                                          }).toList(),
                                        ),
                                        
                                      ],
                                    ),
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                  
                                    child: Row(
                                      crossAxisAlignment :CrossAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'Studio',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(width: 30,),
                                        Wrap(
                                      spacing: 8.0,
                                      children: state.details.productionCompanies
                                          .map((company) {
                                        return Column(
                                          children: [
                                            Text(
                                              company.name,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        );
                                      }).toList(),
                                    ),
                                      ],
                                    ),
                                  ),
                                  
                                ],
                              );
                            } else if (state is DetailError) {
                              return Text(
                                state.message,
                                style: const TextStyle(color: Colors.red),
                              );
                            } else {
                              return const SizedBox.shrink();
                            }
                          },
                        ),
                      ),                      
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
