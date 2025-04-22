import 'package:dartz/dartz.dart';
import 'package:grocery/core/errors/error_model.dart';
import 'package:grocery/src/features/auth/forgotPassword/data/datasource/forgotpassword_remote_ds.dart';

class ForgotPasswordRepo {
   final ForgetPasswordRemoteDs remoteDs;

  ForgotPasswordRepo( this.remoteDs);
  Future<Either<ErrorModel, String>> forgotPassword(String email) async {
    return  await remoteDs.forgetPassword(email);
  }
}
