part of 'location_cubit.dart';

@immutable
sealed class LocationState {}

final class LocationInitial extends LocationState {}

final class LoadingGetLocation extends LocationState {}

final class SuccessGetLocation extends LocationState {
  final String location;
  SuccessGetLocation(this.location);
}

final class FailGetLocation extends LocationState {
  final String error;
  FailGetLocation(this.error);
}
