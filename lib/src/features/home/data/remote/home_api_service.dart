import 'package:dartz/dartz.dart';
import 'package:grocery/core/errors/error_model.dart';

abstract class HomeApiService {
  Future<Either<ErrorModel, void>> getHomeData();
  Future<Either<ErrorModel, void>> getHomeCategories();
  Future<Either<ErrorModel, void>> getHomeProducts();
  Future<Either<ErrorModel, void>> getHomeBanners();
  Future<Either<ErrorModel, void>> getHomeBrands();
  Future<Either<ErrorModel, void>> getHomeOffers();
}

class HomeApiServiceImpl implements HomeApiService {
  @override
  Future<Either<ErrorModel, void>> getHomeBanners() {
    // TODO:  getHomeBanners
    throw UnimplementedError();
  }

  @override
  Future<Either<ErrorModel, void>> getHomeBrands() {
    // TODO: implement getHomeBrands
    throw UnimplementedError();
  }

  @override
  Future<Either<ErrorModel, void>> getHomeCategories() {
    // TODO: implement getHomeCategories
    throw UnimplementedError();
  }

  @override
  Future<Either<ErrorModel, void>> getHomeData() {
    // TODO: implement getHomeData
    throw UnimplementedError();
  }

  @override
  Future<Either<ErrorModel, void>> getHomeOffers() {
    // TODO: implement getHomeOffers
    throw UnimplementedError();
  }

  @override
  Future<Either<ErrorModel, void>> getHomeProducts() {
    // TODO: implement getHomeProducts
    throw UnimplementedError();
  }
}