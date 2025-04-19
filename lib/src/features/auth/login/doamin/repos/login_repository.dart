import 'package:dartz/dartz.dart';
import 'package:grocery/core/errors/error_model.dart';
import 'package:grocery/src/features/auth/login/data/datasource/login_remote_ds.dart';
import 'package:grocery/src/features/auth/login/data/model/login_model.dart';

abstract class ILoginRepository {
  Future<Either<ErrorModel, LoginResponce>> login(
    String email,
    String password,
  );
}

class LoginRepositoryImpl implements ILoginRepository {
  final LoginRemoteDs remoteDs;

  LoginRepositoryImpl(this.remoteDs);

  @override
  Future<Either<ErrorModel, LoginResponce>> login(
      String email, String password) {
    return remoteDs.login(email, password);
  }
}
