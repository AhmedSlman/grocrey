import 'package:dartz/dartz.dart';
import 'package:grocery/core/errors/error_model.dart';
import 'package:grocery/src/features/auth/setNewPass/data/set_new_pass_api_service.dart';

class ResetPasswordRemoteDs {
  final SetNewPassApiService _apiServices;

  ResetPasswordRemoteDs(this._apiServices);

  Future<Either<ErrorModel, String>> resetPassword(
    String email,
    String code,
    String password,
  ) {
    return _apiServices.resetPassword(email, code, password);
  }
}
