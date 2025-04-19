import 'package:dartz/dartz.dart';
import 'package:grocery/core/errors/error_model.dart';
import 'package:grocery/src/features/profile/domain/repositories/profile_repo.dart';

class ChangePasswordUseCase {
  final ProfileRepo profileRepo;
  ChangePasswordUseCase(this.profileRepo);
  Future<Either<ErrorModel, void>> changePassword({
    required String current_password,
    required String new_password,
    required String confirm_new_password,
  }) {
    return profileRepo.changePassword(
      current_password,
      new_password,
      confirm_new_password,
    );
  }
}
