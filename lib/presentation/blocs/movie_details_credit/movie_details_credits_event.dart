abstract class CreditsEvent {}

class LoadCredits extends CreditsEvent {
  final int movieId;

  LoadCredits(this.movieId);
}
