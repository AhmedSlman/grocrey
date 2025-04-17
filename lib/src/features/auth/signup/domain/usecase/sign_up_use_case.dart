import 'package:dartz/dartz.dart';
import 'package:grocery/core/errors/error_model.dart';
import 'package:grocery/src/features/auth/signup/data/model/sign_up_model.dart';
import 'package:grocery/src/features/auth/signup/data/model/sign_up_responce_model.dart';
import 'package:grocery/src/features/auth/signup/domain/repository/signup_repo.dart';

class RegisterUseCase {
  final RegisterRepository _repository;
  RegisterUseCase(this._repository);
  Future<Either<ErrorModel, SignUpResponceModel>> call(
    SignUpModel registerAuthData,
  ) async {
    return _repository.register(registerAuthData);
  }
}
