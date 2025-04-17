import 'package:dartz/dartz.dart';
import 'package:grocery/core/constants/endpoints_strings.dart';
import 'package:grocery/core/errors/error_model.dart';
import 'package:grocery/core/data/api/api_consumer.dart';
import 'package:grocery/core/errors/exceptions.dart';
import 'package:grocery/src/features/auth/signup/data/model/sign_up_model.dart';
import 'package:grocery/src/features/auth/signup/data/model/sign_up_responce_model.dart';

class SignUpApiService {
  final ApiConsumer api;

  SignUpApiService(this.api);

  Future<Either<ErrorModel, SignUpResponceModel>> register(
    SignUpModel data,
  ) async {
    try {
      final response = await api.post(
        EndpointsStrings.register,
        data: data.toJson(),
        isFormData: true,
      );
      final userResponse = SignUpResponceModel.fromJson(response);
      return Right(userResponse);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }
}
