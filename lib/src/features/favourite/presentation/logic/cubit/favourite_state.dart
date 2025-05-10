part of 'favourite_cubit.dart';

@immutable
sealed class FavouriteState {}

final class FavouriteInitial extends FavouriteState {}

final class SuccessGetFavourite extends FavouriteState {
  final FavoritesResponseModel favourite;
  SuccessGetFavourite(this.favourite);
}

final class LoadingGetFavourite extends FavouriteState {}

final class FailGetFavourite extends FavouriteState {
  final String message;
  FailGetFavourite(this.message);
}

final class SuccessAddToFavourite extends FavouriteState {
  final String message;
  final bool isFavourite;
  SuccessAddToFavourite(this.message, {this.isFavourite = false});
}

final class LoadingAddToFavourite extends FavouriteState {}

final class FailAddToFavourite extends FavouriteState {
  final String message;
  FailAddToFavourite(this.message);
}
