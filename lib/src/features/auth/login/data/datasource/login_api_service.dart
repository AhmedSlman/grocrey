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

      // Check if this is a successful response (has user and token)
      if (response['user'] != null && response['token'] != null) {
        final userResponse = LoginResponce.fromJson(response);
        final user = userResponse.user;

        if (user != null) {
          CacheHelper.saveToken(value: userResponse.token);
          CacheHelper.saveData(key: 'name', value: user.name);
          CacheHelper.saveData(key: 'email', value: user.email);
          CacheHelper.saveData(key: 'id', value: user.id);
        }

        return Right(userResponse);
      }
      // If we're here, it means it's an error response
      else {
        throw ServerException(errorModel: ErrorModel.fromJson(response));
      }
    } on ServerException catch (e) {
      return Left(
        e.errorModel.message?.isNotEmpty == true
            ? e.errorModel
            : ErrorModel(message: "Something went wrong"),
      );
    } catch (e) {
      // Handle any other exceptions
      return Left(ErrorModel(message: e.toString()));
    }
  }
}
