import 'package:dartz/dartz.dart';
import 'package:grocery/core/errors/error_model.dart';
import 'package:grocery/src/features/profile/editprofile/data/model/profile_model.dart';
import 'package:grocery/src/features/profile/editprofile/domain/repositories/edit_profile_repo.dart';

class EditProfileUseCases {
  final EditProfileRepo editProfileRepo;
  EditProfileUseCases(this.editProfileRepo);
  Future<Either<ErrorModel, ProfileModel>> call(int id) {
    return editProfileRepo.getUserData(id);
  }
}
