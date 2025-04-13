part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class InitialProfileState extends ProfileState {}

final class LoadingProfileState extends ProfileState {}

class SuccessProfileState extends ProfileState {
  final ProfileModel profileData;

  SuccessProfileState(this.profileData);
}

class FailProfileState extends ProfileState {
  final String error;
  FailProfileState(this.error);
}
