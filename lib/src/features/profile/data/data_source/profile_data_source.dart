import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:grocery/core/constants/endpoints_strings.dart';
import 'package:grocery/core/data/api/api_consumer.dart';
import 'package:grocery/core/errors/error_model.dart';
import 'package:grocery/core/errors/exceptions.dart';
import 'package:grocery/src/features/profile/data/model/ordermodel.dart';
import 'package:grocery/src/features/profile/data/model/profile_model.dart';

abstract class ProfileDataSource {
  Future<Either<ErrorModel, ProfileModel>> getUserData(int id);
  Future<Either<ErrorModel, void>> updateData(
    String id,
    String nameController,
    String emailController,
    String imagePath,
  );
  Future<Either<ErrorModel, void>> changePassword(
    String currentPassword,
    String newPassword,
    String confirmNewPassword,
  );
  Future<Either<ErrorModel, OrdersModel>> getallOrders();
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
    String id,
    String nameController,
    String emailController,
    String imagePath,
  ) async {
    try {
      var response = await api.post(
        "${EndpointsStrings.update_profile}$id",
        data: {
          'name': nameController,
          'email': emailController,
          // 'image': XFile(imagePath),
        },
      );
      print(response.toString());
      return Right(response);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }

  @override
  Future<Either<ErrorModel, void>> changePassword(
    String currentPassword,
    String newPassword,
    String confirmNewPassword,
  ) async {
    try {
      var response = await api.post(
        EndpointsStrings.change_password,
        data: {
          'old_password': currentPassword,
          'new_password': newPassword,
          'new_password_confirmation': confirmNewPassword,
        },
      );
      return Right(response);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }

  @override
  Future<Either<ErrorModel, OrdersModel>> getallOrders() async {
    try {
      var response = await api.get('/user/all_orders/1');
      OrdersModel data = OrdersModel.fromJson(response);
      return Right(data);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }
}
