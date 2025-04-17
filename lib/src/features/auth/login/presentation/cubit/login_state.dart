part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginSuccessState extends LoginState {
  final LoginResponce loginResponce;

  LoginSuccessState({required this.loginResponce});
}

final class LoginErrorState extends LoginState {
  final ErrorModel errorModel;
  LoginErrorState({required this.errorModel});
}
