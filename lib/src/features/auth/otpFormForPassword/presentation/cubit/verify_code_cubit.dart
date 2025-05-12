import 'package:bloc/bloc.dart';
import 'package:grocery/src/features/auth/otpFormForPassword/doamin/repos/verify_code_repo.dart';
import 'package:meta/meta.dart';

part 'verify_code_state.dart';

class VerifyCodeCubit extends Cubit<VerifyCodeState> {
  final VerifyCodeRepo verifyCodeRepo;
  VerifyCodeCubit(this.verifyCodeRepo) : super(VerifyCodeInitial());
  Future<void> verifyCode(
    String email,
    String code,
    String password,
    String confirmPassword,
  ) async {
    emit(VerifyCodeLoadingState());
    final result = await verifyCodeRepo.verifyCode(
      email,
      code,
      password,
      confirmPassword,
    );
    result.fold(
      (error) => emit(VerifyCodeErrorState(message: error.message!)),
      (message) => emit(VerifyCodeSuccessState(message: message)),
    );
  }
}
