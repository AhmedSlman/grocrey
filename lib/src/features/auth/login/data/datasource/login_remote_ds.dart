import 'package:dartz/dartz.dart';
import 'package:grocery/core/errors/error_model.dart';
import 'package:grocery/src/features/auth/login/data/datasource/login_api_service.dart';
import 'package:grocery/src/features/auth/login/data/model/login_model.dart';
class LoginRemoteDs {
  final LoginApiService _apiServices;

  LoginRemoteDs(this._apiServices);

  Future<Either<ErrorModel, LoginResponce>> login(String email, String password) {
    return _apiServices.login(email, password);
  }
}
