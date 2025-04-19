import 'package:dartz/dartz.dart';
import 'package:grocery/core/errors/error_model.dart';
import 'package:grocery/src/features/auth/signup/data/datasource/signup_api_service.dart';
import 'package:grocery/src/features/auth/signup/data/model/sign_up_model.dart';
import 'package:grocery/src/features/auth/signup/data/model/sign_up_responce_model.dart';

class SginUpRemoteDS {
  final SignUpApiService _apiServices;

  SginUpRemoteDS(this._apiServices);

  Future<Either<ErrorModel, SignUpResponceModel>> register(SignUpModel data) {
    return _apiServices.register(data);
  }
}
