import 'package:dartz/dartz.dart';
import 'package:grocery/core/errors/error_model.dart';
import 'package:grocery/src/features/auth/forgotPassword/data/datasource/forgot_passsword_api_service.dart';

class ForgetPasswordRemoteDs {
  final ForgetPasswordApiService _apiServices;

  ForgetPasswordRemoteDs(this._apiServices);

  Future<Either<ErrorModel, String>> forgetPassword(String email) {
    return _apiServices.forgetPassword(email);
  }
}
