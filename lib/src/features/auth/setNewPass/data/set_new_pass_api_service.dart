import 'package:dartz/dartz.dart';
import 'package:grocery/core/errors/error_model.dart';
import 'package:grocery/core/data/api/api_consumer.dart';
import 'package:grocery/core/errors/exceptions.dart';

class SetNewPassApiService {
  final ApiConsumer api;

  SetNewPassApiService(this.api);

  Future<Either<ErrorModel, String>> resetPassword(
    String email,
    String code,
    String password,
  ) async {
    try {
      final response = await api.post(
        'update-password',
        data: {"identifier": email, "code": code, "password": password},
        isFormData: true,
      );
      return Right(response['message']);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }
}
