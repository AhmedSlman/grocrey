import 'package:dartz/dartz.dart';
import 'package:grocery/core/errors/error_model.dart';
import 'package:grocery/src/features/profile/data/data_source/update_profile_data_source.dart';
import 'package:grocery/src/features/profile/data/model/profile_model.dart';
import 'package:grocery/src/features/profile/domain/repositories/edit_profile_repo.dart';

class EditProfileRepoImpl extends EditProfileRepo {
  final EditProfileDataSource updateProfileDataSource;
  EditProfileRepoImpl(this.updateProfileDataSource);
  @override
  Future<Either<ErrorModel, ProfileModel>> getUserData(int id) async {
    return await updateProfileDataSource.getUserData(id);
  }
}
