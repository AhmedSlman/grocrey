import 'package:dartz/dartz.dart';
import 'package:grocery/core/errors/error_model.dart';
import 'package:grocery/core/data/api/api_consumer.dart';
import 'package:grocery/core/data/cached/cache_helper.dart';
import 'package:grocery/core/errors/exceptions.dart';
import 'package:grocery/src/features/auth/login/data/model/login_model.dart';

class LoginApiService {
  final ApiConsumer api;

  LoginApiService(this.api);

  Future<Either<ErrorModel, LoginResponce>> login(
    String email,
    String password,
  ) async {
    try {
      final response = await api.post(
        'login',
        data: {'email': email, 'password': password},
        isFormData: true,
      );
      final userResponse = LoginResponce.fromJson(response);
      CacheHelper.saveToken(value: userResponse.token);
      CacheHelper.saveData(key: 'name', value: userResponse.user.name);
      CacheHelper.saveData(key: 'email', value: userResponse.user.email);

      return Right(userResponse);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }
}
