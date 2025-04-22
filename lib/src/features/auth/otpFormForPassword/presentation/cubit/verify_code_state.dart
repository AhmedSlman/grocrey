part of 'verify_code_cubit.dart';

@immutable
sealed class VerifyCodeState {}

final class VerifyCodeInitial extends VerifyCodeState {}

final class VerifyCodeLoadingState extends VerifyCodeState {}

final class VerifyCodeSuccessState extends VerifyCodeState {
  final String message;
  VerifyCodeSuccessState({required this.message});
}

final class VerifyCodeErrorState extends VerifyCodeState {
  final String message;
  VerifyCodeErrorState({required this.message});
}
