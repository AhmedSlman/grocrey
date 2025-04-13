import 'package:dartz/dartz.dart';
import 'package:grocery/core/errors/error_model.dart';
import 'package:grocery/src/features/profile/data/model/profile_model.dart';

abstract class EditProfileRepo {
  Future<Either<ErrorModel, ProfileModel>> getUserData(int id);
}
