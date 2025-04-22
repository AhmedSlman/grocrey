part of 'forgot_passworrd_cubit.dart';

@immutable
sealed class ForgotPassworrdState {}

final class ForgotPassworrdInitial extends ForgotPassworrdState {}
final class ForgotPassworrdLoadingState extends ForgotPassworrdState {}
final class ForgotPassworrdSuccessState extends ForgotPassworrdState {
  final String message;
  ForgotPassworrdSuccessState({required this.message});
}
final class ForgotPassworrdErrorState extends ForgotPassworrdState {
  final String error;
  ForgotPassworrdErrorState({required this.error});
}
