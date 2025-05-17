part of 'set_new_pass_cubit.dart';

@immutable
sealed class SetNewPassState {}

final class SetNewPassInitial extends SetNewPassState {}

final class SetNewPassLoadingState extends SetNewPassState {}

final class SetNewPassSuccessState extends SetNewPassState {
  final String message;
  SetNewPassSuccessState({required this.message});
}

final class SetNewPassErrorState extends SetNewPassState {
  final String error;
  SetNewPassErrorState({required this.error});
}
