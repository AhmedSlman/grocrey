import 'package:dartz/dartz.dart';
import 'package:grocery/core/errors/error_model.dart';
import 'package:grocery/src/features/auth/login/data/model/login_model.dart';
import 'package:grocery/src/features/auth/login/doamin/repos/login_repository.dart';

class LoginUseCase {
  final ILoginRepository loginRepository;

  LoginUseCase(this.loginRepository);
  Future<Either<ErrorModel, LoginResponce>> call(
    String email,
    String password,
  ) async {
    return await loginRepository.login(email, password);
  }
}
