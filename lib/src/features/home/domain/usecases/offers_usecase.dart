import 'package:dartz/dartz.dart';
import 'package:grocery/core/errors/error_model.dart';
import 'package:grocery/src/features/home/data/model/offers_model.dart';
import 'package:grocery/src/features/home/data/model/product_model.dart';
import 'package:grocery/src/features/home/domain/repos/home_repo.dart';

class GetOffersUseCase {
  final HomeRepo homeRepo;
  GetOffersUseCase(this.homeRepo);
  Future<Either<ErrorModel, OffersModel>> getOffers() {
    return homeRepo.getHomeOffers();
  }
}
