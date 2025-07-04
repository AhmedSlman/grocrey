import 'package:dartz/dartz.dart';
import 'package:grocery/core/errors/error_model.dart';
import 'package:grocery/src/features/profile/data/model/ordermodel.dart';
import 'package:grocery/src/features/profile/data/model/profile_model.dart';

abstract class ProfileRepo {
  Future<Either<ErrorModel, ProfileModel>> getUserData(int id);

  Future<Either<ErrorModel, void>> updateUserData(
    String id,
    String nameController,
    String emailController,
    String imagePath,
  );

  Future<Either<ErrorModel, void>> changePassword(
    String id,
    String currentPassword,
    String newPassword,
    String confirmNewPassword,
  );
  Future<Either<ErrorModel, OrdersModel>> getallOrders();
}
