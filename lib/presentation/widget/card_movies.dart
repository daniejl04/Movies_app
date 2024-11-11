import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movies_test/config/router/app_router.dart';
import 'package:movies_test/domain/domain.dart';
import 'package:movies_test/presentation/widget/image_card.dart';

class CardsMovies extends StatelessWidget {
  final Movie movie;

  const CardsMovies({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {
        RouterSimpleCubit routerCubit = context.read<RouterSimpleCubit>();
        routerCubit.goDetails(context, movie);
      },
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.all(10),
        child: SizedBox(
          width: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyImage(movie.posterPath),
              Text(
                movie.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                  height: 60,
                  child: RatingBar.builder(
                    itemSize: 10,
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
        ),
      ),
    );
  }
}
