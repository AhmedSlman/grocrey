import 'package:dartz/dartz.dart';
import 'package:grocery/core/errors/error_model.dart';
import 'package:grocery/src/features/profile/domain/repositories/profile_repo.dart';

class ChangePasswordUseCase {
  final ProfileRepo profileRepo;
  ChangePasswordUseCase(this.profileRepo);
  Future<Either<ErrorModel, void>> changePassword({
    required String id,
    required String currentPassword,
    required String newPassword,
    required String confirmNewPassword,
  }) {
    return profileRepo.changePassword(
      id,
      currentPassword,
      newPassword,
      confirmNewPassword,
    );
  }
}
