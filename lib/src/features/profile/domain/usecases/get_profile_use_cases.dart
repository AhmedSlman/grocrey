import 'package:dartz/dartz.dart';
import 'package:grocery/core/errors/error_model.dart';
import 'package:grocery/src/features/profile/data/model/profile_model.dart';
import 'package:grocery/src/features/profile/domain/repositories/profile_repo.dart';

class GetProfileUseCases {
  final ProfileRepo editProfileRepo;
  GetProfileUseCases(this.editProfileRepo);
  Future<Either<ErrorModel, ProfileModel>> call(int id) {
    return editProfileRepo.getUserData(id);
  }
}
