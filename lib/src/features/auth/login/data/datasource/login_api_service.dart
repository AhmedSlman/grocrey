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
        'user/login',
        data: {'email': email, 'password': password},
        isFormData: true,
      );

      if (response['user'] != null && response['token'] != null) {
        final userResponse = LoginResponce.fromJson(response);
        final user = userResponse.user;

        if (user != null) {
          CacheHelper.saveToken(value: userResponse.token);
          CacheHelper.saveData(key: 'name', value: user.name);
          CacheHelper.saveData(key: 'email', value: user.email);
        }

        return Right(userResponse);
      } else {
        // لو السيرفر رجع استجابة فيها فقط رسالة خطأ
        throw ServerException(errorModel: ErrorModel.fromJson(response));
      }
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }
}
