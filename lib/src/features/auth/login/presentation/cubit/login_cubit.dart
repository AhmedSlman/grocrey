import 'package:bloc/bloc.dart';
import 'package:grocery/core/errors/error_model.dart';
import 'package:grocery/src/features/auth/login/data/model/login_model.dart';
import 'package:grocery/src/features/auth/login/doamin/usecase/login_use_case.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;
  LoginCubit(this.loginUseCase) : super(LoginInitial());

  Future<void> login(String email, String password) async {
    emit(LoginLoadingState());

    final result = await loginUseCase.call(email, password);
    result.fold(
      (error) => emit(LoginErrorState(errorModel: error)),
      (response) => emit(LoginSuccessState(loginResponce: response)),
    );
  }
}
