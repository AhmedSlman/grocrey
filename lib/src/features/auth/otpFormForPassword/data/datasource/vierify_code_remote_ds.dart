import 'package:dartz/dartz.dart';
import 'package:grocery/core/errors/error_model.dart';
import 'package:grocery/src/features/auth/otpFormForPassword/data/datasource/verify_code_api_service.dart';

class VerifyCodeRemoteDs {
  final VerifyCodeApiService _apiServices;

  VerifyCodeRemoteDs(this._apiServices);

  Future<Either<ErrorModel, String>> verifyCode(String email, String code) {
    return _apiServices.verifyCode(email, code);
  }
}
