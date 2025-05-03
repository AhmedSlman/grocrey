import 'package:dartz/dartz.dart';
import 'package:grocery/core/errors/error_model.dart';
import 'package:grocery/src/features/home/data/model/category_model.dart';
import 'package:grocery/src/features/home/data/model/offers_model.dart';
import 'package:grocery/src/features/home/data/model/category_model_detail.dart';
import 'package:grocery/src/features/home/data/remote/home_remote_data_source.dart';

abstract class HomeRepo {
  Future<Either<ErrorModel, void>> getHomeData();
  Future<Either<ErrorModel, List<CategoryModel>>> getHomeCategories();
  Future<Either<ErrorModel, CategoryModelDetail>> getHomeProducts(productId);
  Future<Either<ErrorModel, void>> getHomeBanners();
  Future<Either<ErrorModel, void>> getHomeBrands();
  Future<Either<ErrorModel, OffersModel>> getHomeOffers();
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
  Future<Either<ErrorModel, List<CategoryModel>>> getHomeCategories() {
    return _homeRemoteDataSource.getHomeCategories();
  }

  @override
  Future<Either<ErrorModel, void>> getHomeData() {
    return _homeRemoteDataSource.getHomeData();
  }

  @override
  Future<Either<ErrorModel, OffersModel>> getHomeOffers() {
    return _homeRemoteDataSource.getHomeOffers();
  }

  @override
  Future<Either<ErrorModel, CategoryModelDetail>> getHomeProducts(productId) {
    return _homeRemoteDataSource.getHomeProducts(productId);
  }
}
