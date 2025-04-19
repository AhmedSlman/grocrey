import 'package:bloc/bloc.dart';
import 'package:grocery/core/errors/error_model.dart';
import 'package:grocery/src/features/auth/signup/data/model/sign_up_model.dart';
import 'package:grocery/src/features/auth/signup/data/model/sign_up_responce_model.dart';
import 'package:grocery/src/features/auth/signup/domain/usecase/sign_up_use_case.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final RegisterUseCase registerUseCase;

  SignUpCubit(this.registerUseCase) : super(SignUpInitial());

  Future<void> register(SignUpModel signUpModel) async {
    emit(RegisterLoadingState());

    final result = await registerUseCase.call(signUpModel);

    result.fold(
      (error) => emit(RegisterFailureState(errorMessage: error)),
      (response) => emit(RegisterSuccessState(userModel: response)),
    );
  }
}
