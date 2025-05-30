import 'package:dartz/dartz.dart';
import 'package:grocery/core/errors/error_model.dart';
import 'package:grocery/src/features/auth/setNewPass/data/remoteData/set_new_pass_api_service.dart';

class SetNewPassRemoteds {
  final SetNewPassApiService apiService;

  SetNewPassRemoteds(this.apiService);
  Future <Either<ErrorModel, String>> setNewPass(String email,String password,String confirmPassword,String code) async{
    return await apiService.setNewPass(email,password,confirmPassword,code);
  }
}