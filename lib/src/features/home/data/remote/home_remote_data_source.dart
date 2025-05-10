import 'package:dartz/dartz.dart';
import 'package:grocery/core/errors/error_model.dart';
import 'package:grocery/src/features/home/data/model/category_model.dart';
import 'package:grocery/src/features/home/data/model/offers_model.dart';
import 'package:grocery/src/features/home/data/model/category_model_detail.dart';
import 'package:grocery/src/features/home/data/model/search_model.dart';
import 'package:grocery/src/features/home/data/remote/home_api_service.dart';

abstract class HomeRemoteDataSource {
  Future<Either<ErrorModel, void>> getHomeData();
  Future<Either<ErrorModel, List<CategoryModel>>> getHomeCategories();
  Future<Either<ErrorModel, CategoryModelDetail>> getHomeProducts(productId);
  Future<Either<ErrorModel, void>> getHomeBanners();
  Future<Either<ErrorModel, void>> getHomeBrands();
  Future<Either<ErrorModel, OffersModel>> getHomeOffers();
  Future<Either<ErrorModel, SearchModel>> getSearchData(String query);
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final HomeApiService homeApiService;

  HomeRemoteDataSourceImpl(this.homeApiService);
  @override
  Future<Either<ErrorModel, void>> getHomeBanners() {
    return homeApiService.getHomeBanners();
  }

  @override
  Future<Either<ErrorModel, void>> getHomeBrands() {
    return homeApiService.getHomeBrands();
  }

  @override
  Future<Either<ErrorModel, List<CategoryModel>>> getHomeCategories() {
    return homeApiService.getHomeCategories();
  }

  @override
  Future<Either<ErrorModel, void>> getHomeData() {
    return homeApiService.getHomeData();
  }

  @override
  Future<Either<ErrorModel, OffersModel>> getHomeOffers() {
    return homeApiService.getHomeOffers();
  }

  @override
  Future<Either<ErrorModel, CategoryModelDetail>> getHomeProducts(productId) {
    return homeApiService.getHomeProducts(productId);
  }

  @override
  Future<Either<ErrorModel, SearchModel>> getSearchData(String query) {
    return homeApiService.getSearchData(query);
  }
}
