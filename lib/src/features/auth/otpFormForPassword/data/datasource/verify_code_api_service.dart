import 'package:dartz/dartz.dart';
import 'package:grocery/core/errors/error_model.dart';
import 'package:grocery/core/data/api/api_consumer.dart';
import 'package:grocery/core/errors/exceptions.dart';

class VerifyCodeApiService {
  final ApiConsumer api;

  VerifyCodeApiService(this.api);

  Future<Either<ErrorModel, String>> verifyCode(
    String email,
    String code,
    String passwordConfirmation,
    String password,
  ) async {
    try {
      final response = await api.post(
        'user/reset-password',
        data: {
          "identifier": email,
          "token": code,
          "password_confirmation": passwordConfirmation,
          "password": password,
        },
        isFormData: true,
      );
      return Right(response['message']);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }
}
