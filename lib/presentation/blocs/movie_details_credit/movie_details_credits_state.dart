import 'package:movies_test/domain/domain.dart';

abstract class CreditsState {}

class CreditInitial extends CreditsState {}

class CreditLoading extends CreditsState {}

class CreditLoaded extends CreditsState {
  final List<Credits> nowPlayingCredits;

  CreditLoaded({
    required this.nowPlayingCredits,
  });
}

class CreditError extends CreditsState {
  final String message;

  CreditError(this.message);
}

