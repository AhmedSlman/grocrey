import 'package:dartz/dartz.dart';
import 'package:grocery/core/errors/error_model.dart';
import 'package:grocery/src/features/home/data/remote/home_remote_data_source.dart';

abstract class HomeRepo {
  Future<Either<ErrorModel, void>> getHomeData();
  Future<Either<ErrorModel, void>> getHomeCategories();
  Future<Either<ErrorModel, void>> getHomeProducts();
  Future<Either<ErrorModel, void>> getHomeBanners();
  Future<Either<ErrorModel, void>> getHomeBrands();
  Future<Either<ErrorModel, void>> getHomeOffers();
}

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource _homeRemoteDataSource;

  HomeRepoImpl(this._homeRemoteDataSource);
  @override
  Future<Either<ErrorModel, void>> getHomeBanners() {
    return _homeRemoteDataSource.getHomeBanners();
  }

  @override
  Future<Either<ErrorModel, void>> getHomeBrands() {
    return _homeRemoteDataSource.getHomeBrands();
  }

  @override
  Future<Either<ErrorModel, void>> getHomeCategories() {
    return _homeRemoteDataSource.getHomeCategories();
  }

  @override
  Future<Either<ErrorModel, void>> getHomeData() {
    return _homeRemoteDataSource.getHomeData();
  }

  @override
  Future<Either<ErrorModel, void>> getHomeOffers() {
    return _homeRemoteDataSource.getHomeOffers();
  }

  @override
  Future<Either<ErrorModel, void>> getHomeProducts() {
    return _homeRemoteDataSource.getHomeProducts();
  }
}
