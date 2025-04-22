import 'package:bloc/bloc.dart';
import 'package:grocery/src/features/auth/forgotPassword/domain/repos/forgot_password_repo.dart';
import 'package:meta/meta.dart';

part 'forgot_passworrd_state.dart';

class ForgotPassworrdCubit extends Cubit<ForgotPassworrdState> {
  final ForgotPasswordRepo forgotPasswordRepo;
  ForgotPassworrdCubit(this.forgotPasswordRepo)
    : super(ForgotPassworrdInitial());

  Future<void> forgotPassword({required String email}) async {
    emit(ForgotPassworrdLoadingState());
    final result = await forgotPasswordRepo.forgotPassword(email);
    result.fold(
      (error) => emit(ForgotPassworrdErrorState(error: error.message!)),
      (message) => emit(ForgotPassworrdSuccessState(message: message)),
    );
  }
}
