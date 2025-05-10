import 'package:dartz/dartz.dart';
import 'package:grocery/core/errors/error_model.dart';
import 'package:grocery/src/features/profile/data/model/ordermodel.dart';
import 'package:grocery/src/features/profile/domain/repositories/profile_repo.dart';

class GetOrdersUseCase {
  final ProfileRepo profileRepo;

  GetOrdersUseCase(this.profileRepo);

  Future<Either<ErrorModel, OrdersModel>> call() async {
    return await profileRepo.getallOrders();
  }
}
