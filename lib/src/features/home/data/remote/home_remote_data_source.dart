import 'package:dartz/dartz.dart';
import 'package:grocery/core/errors/error_model.dart';
import 'package:grocery/src/features/home/data/remote/home_api_service.dart';

abstract class HomeRemoteDataSource {
  Future<Either<ErrorModel, void>> getHomeData();
  Future<Either<ErrorModel, void>> getHomeCategories();
  Future<Either<ErrorModel, void>> getHomeProducts();
  Future<Either<ErrorModel, void>> getHomeBanners();
  Future<Either<ErrorModel, void>> getHomeBrands();
  Future<Either<ErrorModel, void>> getHomeOffers();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final HomeApiService _homeApiService;

  HomeRemoteDataSourceImpl(this._homeApiService);
  @override
  Future<Either<ErrorModel, void>> getHomeBanners() {
    return _homeApiService.getHomeBanners();
  }

  @override
  Future<Either<ErrorModel, void>> getHomeBrands() {
    return _homeApiService.getHomeBrands();
  }

  @override
  Future<Either<ErrorModel, void>> getHomeCategories() {
    return _homeApiService.getHomeCategories();
  }

  @override
  Future<Either<ErrorModel, void>> getHomeData() {
    return _homeApiService.getHomeData();
  }

  @override
  Future<Either<ErrorModel, void>> getHomeOffers() {
    return _homeApiService.getHomeOffers();
  }

  @override
  Future<Either<ErrorModel, void>> getHomeProducts() {
    return _homeApiService.getHomeProducts();
  }
}
