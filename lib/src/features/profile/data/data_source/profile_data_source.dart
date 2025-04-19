import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:grocery/core/constants/endpoints_strings.dart';
import 'package:grocery/core/data/api/api_consumer.dart';
import 'package:grocery/core/errors/error_model.dart';
import 'package:grocery/core/errors/exceptions.dart';
import 'package:grocery/src/features/profile/data/model/profile_model.dart';

abstract class ProfileDataSource {
  Future<Either<ErrorModel, ProfileModel>> getUserData(int id);
  Future<Either<ErrorModel, void>> updateData(nameController, emailController);
  Future<Either<ErrorModel, void>> changePassword(
    String current_password,
    String new_password,
    String confirm_new_password,
  );
}

class ProfileDataSourceImpl extends ProfileDataSource {
  final ApiConsumer api;

  ProfileDataSourceImpl(this.api);
  @override
  Future<Either<ErrorModel, ProfileModel>> getUserData(int id) async {
    try {
      var response = await api.get("${EndpointsStrings.profile}$id");
      ProfileModel data = ProfileModel.fromJson(response['message']);
      return Right(data);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }

  @override
  Future<Either<ErrorModel, void>> updateData(
    nameController,
    emailController,
  ) async {
    try {
      var response = await api.post(
        "${EndpointsStrings.update_profile}4",
        data: {'name': nameController, 'email': emailController},
      );
      print(response.toString());
      return Right(response);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }

  @override
  Future<Either<ErrorModel, void>> changePassword(
    String current_password,
    String new_password,
    String confirm_new_password,
  ) async {
    try {
      var response = await api.post(
        '${EndpointsStrings.change_password}4',
        data: {
          'old_password': current_password,
          'new_password': new_password,
          'new_password_confirmation': confirm_new_password,
        },
      );
      return Right(response);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }
}
