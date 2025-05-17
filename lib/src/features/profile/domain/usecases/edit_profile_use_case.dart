import 'package:dartz/dartz.dart';
import 'package:grocery/core/errors/error_model.dart';
import 'package:grocery/src/features/profile/domain/repositories/profile_repo.dart';

class UpdateProfileUseCases {
  final ProfileRepo profileRepo;
  UpdateProfileUseCases(this.profileRepo);
  Future<Either<ErrorModel, void>> call(
    String id,
    String nameController,
    String emailController,
    String imagePath,
  ) {
    return profileRepo.updateUserData(
      id,
      nameController,
      emailController,
      imagePath,
    );
  }
}
