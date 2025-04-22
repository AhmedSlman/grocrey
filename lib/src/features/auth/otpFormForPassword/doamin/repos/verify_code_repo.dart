import 'package:dartz/dartz.dart';
import 'package:grocery/core/errors/error_model.dart';
import 'package:grocery/src/features/auth/otpFormForPassword/data/datasource/vierify_code_remote_ds.dart';

class VerifyCodeRepo {
  final VerifyCodeRemoteDs remoteDs;

  VerifyCodeRepo(this.remoteDs);
  Future<Either<ErrorModel, String>> verifyCode(
    String code,
    String email,
    String password,
    String confirmPassword,
  ) async {
    return await remoteDs.verifyCode(code, email, password, confirmPassword);
  }
}
