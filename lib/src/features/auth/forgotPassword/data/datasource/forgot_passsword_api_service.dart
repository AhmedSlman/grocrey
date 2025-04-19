
import 'package:dartz/dartz.dart';
import 'package:grocery/core/errors/error_model.dart';
import 'package:grocery/core/data/api/api_consumer.dart';
import 'package:grocery/core/errors/exceptions.dart';

class ForgetPasswordApiService {
  final ApiConsumer api;

  ForgetPasswordApiService(this.api);

  Future<Either<ErrorModel, String>> forgetPassword(String email) async {
    try {
      final response = await api.post(
        'forgot-password',
        data: {
          "identifier": email,
        },
        isFormData: true,
      );
      return Right(response['message']);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }
}
