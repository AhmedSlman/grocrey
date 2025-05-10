import 'package:dartz/dartz.dart';
import 'package:grocery/core/errors/error_model.dart';
import 'package:grocery/src/features/profile/data/data_source/profile_data_source.dart';
import 'package:grocery/src/features/profile/data/model/ordermodel.dart';
import 'package:grocery/src/features/profile/data/model/profile_model.dart';
import 'package:grocery/src/features/profile/domain/repositories/profile_repo.dart';

class ProfileRepoImpl extends ProfileRepo {
  final ProfileDataSource profileDataSource;
  ProfileRepoImpl(this.profileDataSource);
  @override
  Future<Either<ErrorModel, ProfileModel>> getUserData(int id) async {
    return await profileDataSource.getUserData(id);
  }

  @override
  Future<Either<ErrorModel, void>> updateUserData(
    nameController,
    emailController,
    String imagePath,
  ) async {
    return await profileDataSource.updateData(
      nameController,
      emailController,
      imagePath,
    );
  }

  @override
  Future<Either<ErrorModel, void>> changePassword(
    String current_password,
    String new_password,
    String confirm_new_password,
  ) async {
    return await profileDataSource.changePassword(
      current_password,
      new_password,
      confirm_new_password,
    );
  }

  @override
  Future<Either<ErrorModel, OrdersModel>> getallOrders() async {
    return await profileDataSource.getallOrders();
  }
}
