part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class RegisterLoadingState extends SignUpState {}

final class RegisterSuccessState extends SignUpState {
  final SignUpResponceModel userModel;

  RegisterSuccessState({required this.userModel});
}

final class RegisterFailureState extends SignUpState {
  final ErrorModel errorMessage;

  RegisterFailureState({required this.errorMessage});
}
