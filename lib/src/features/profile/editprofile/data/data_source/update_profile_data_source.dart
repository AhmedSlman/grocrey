import 'package:dartz/dartz.dart';
import 'package:grocery/core/constants/endpoints_strings.dart';
import 'package:grocery/core/data/api/api_consumer.dart';
import 'package:grocery/core/errors/error_model.dart';
import 'package:grocery/core/errors/exceptions.dart';
import 'package:grocery/src/features/profile/editprofile/data/model/profile_model.dart';

abstract class EditProfileDataSource {
  Future<Either<ErrorModel, ProfileModel>> getUserData(int id);
}

class EditProfileDataSourceImpl extends EditProfileDataSource {
  final ApiConsumer api;

  EditProfileDataSourceImpl(this.api);
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
}
