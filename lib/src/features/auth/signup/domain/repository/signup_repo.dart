import 'package:dartz/dartz.dart';
import 'package:grocery/core/errors/error_model.dart';
import 'package:grocery/src/features/auth/signup/data/datasource/signup_remote_ds.dart';
import 'package:grocery/src/features/auth/signup/data/model/sign_up_model.dart';
import 'package:grocery/src/features/auth/signup/data/model/sign_up_responce_model.dart';

abstract class RegisterRepository {
  Future<Either<ErrorModel, SignUpResponceModel>> register(SignUpModel data);
}

class RegisterRepositoryImpl implements RegisterRepository {
  final SginUpRemoteDS remoteDs;

  RegisterRepositoryImpl(this.remoteDs);

  @override
  Future<Either<ErrorModel, SignUpResponceModel>> register(SignUpModel data) {
    return remoteDs.register(data);
  }
}
