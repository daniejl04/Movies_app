import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_test/config/helpers/getMoviesApi.dart';
import 'package:movies_test/domain/domain.dart';
import 'package:movies_test/presentation/blocs/blocs.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final MoviesApi moviesApi;

  DetailsBloc(this.moviesApi) : super(DetailInitial()) {
    on<LoadDetails>(_onLoadDetails);
  }

  Future<void> _onLoadDetails(
      LoadDetails event, Emitter<DetailsState> emit) async {
    emit(DetailLoading());
    try {
      final response = await moviesApi.getDetails(event.movieId);
      final details = Details.fromJson(response);

      emit(DetailLoaded(details: details));
    } catch (e) {
      emit(DetailError('Error loading movie details: $e'));
    }
  }
}
