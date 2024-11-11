import 'package:movies_test/domain/domain.dart';

abstract class DetailsState {}

class DetailInitial extends DetailsState {}

class DetailLoading extends DetailsState {}


class DetailLoaded extends DetailsState {
  final Details details;

  DetailLoaded({required this.details});
}

class DetailError extends DetailsState {
  final String message;

  DetailError(this.message);
}

