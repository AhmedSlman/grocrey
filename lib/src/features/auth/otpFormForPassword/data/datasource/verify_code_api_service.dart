
import 'package:dartz/dartz.dart';
import 'package:grocery/core/errors/error_model.dart';
import 'package:grocery/core/data/api/api_consumer.dart';
import 'package:grocery/core/errors/exceptions.dart';

class VerifyCodeApiService {
  final ApiConsumer api;

  VerifyCodeApiService(this.api);

  Future<Either<ErrorModel, String>> verifyCode(String email, String code) async {
    try {
      final response = await api.post(
        'verify-code',
        data: {
          "identifier": email,
          "code": code,
        },
        isFormData: true,
      );
      return Right(response['message']);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }
}
