part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class InitialProfileState extends ProfileState {}

final class LoadingProfileState extends ProfileState {}

class SuccessProfileState extends ProfileState {
  final ProfileModel profileData;

  SuccessProfileState(this.profileData);
}

final class LoadingUpdateProfileState extends ProfileState {}

class SuccessUpdateProfile extends ProfileState {}

class FailProfileState extends ProfileState {
  final String error;
  FailProfileState(this.error);
}
