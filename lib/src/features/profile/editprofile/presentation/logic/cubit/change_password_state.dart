part of 'change_password_cubit.dart';

@immutable
sealed class ChangePasswordState {}

final class ChangePasswordInitial extends ChangePasswordState {}

class SuccessChangePassword extends ChangePasswordState {
  final String message;

  SuccessChangePassword(this.message);
}

class LoadingChangePassword extends ChangePasswordState {}

class FailChangePassword extends ChangePasswordState {
  final String message;
  FailChangePassword(this.message);
}
