import 'package:dartz/dartz.dart';
import 'package:grocery/core/data/api/api_consumer.dart';
import 'package:grocery/core/errors/error_model.dart';

class SetNewPassApiService {
  final  ApiConsumer _api;

  SetNewPassApiService(this._api);
Future<Either<ErrorModel, String>> setNewPass(String email,String password,String confirmPassword,String code) async{
  final response = await _api.post(
      'user/reset-password',
      data: {
        "identifier": email,
        "token": code,
        "password_confirmation": confirmPassword,
        "password": password,
      },
      isFormData: true,
  );
  return Right(response['message']);
  

}
  

}
