part of 'favourite_cubit.dart';

@immutable
sealed class FavouriteState {}

final class FavouriteInitial extends FavouriteState {}

final class SuccessGetFavourite extends FavouriteState {
  final FavouriteModel favourite;
  SuccessGetFavourite(this.favourite);
}

final class LoadingGetFavourite extends FavouriteState {}

final class FailGetFavourite extends FavouriteState {}

final class SuccessAddToFavourite extends FavouriteState {
  final String message;
  SuccessAddToFavourite(this.message);
}

final class LoadingAddToFavourite extends FavouriteState {}

final class FailAddToFavourite extends FavouriteState {
  final String message;
  FailAddToFavourite(this.message);
}
