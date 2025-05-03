import 'package:dartz/dartz.dart';
import 'package:grocery/core/errors/error_model.dart';
import 'package:grocery/src/features/home/data/model/category_model_detail.dart';
import 'package:grocery/src/features/home/domain/repos/home_repo.dart';

class GetProductsUseCase {
  final HomeRepo homeRepo;
  GetProductsUseCase(this.homeRepo);
  Future<Either<ErrorModel, CategoryModelDetail>> getProducts(productId) {
    return homeRepo.getHomeProducts(productId);
  }
}
