import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:grocery/core/data/api/api_consumer.dart';
import 'package:grocery/core/errors/error_model.dart';
import 'package:grocery/core/errors/exceptions.dart';
import 'package:grocery/src/features/home/data/model/category_model.dart';
import 'package:grocery/src/features/home/data/model/offers_model.dart';
import 'package:grocery/src/features/home/data/model/product_model.dart';

abstract class HomeApiService {
  Future<Either<ErrorModel, void>> getHomeData();
  Future<Either<ErrorModel, List<CategoryModel>>> getHomeCategories();
  Future<Either<ErrorModel, CategoryModelDetail>> getHomeProducts(productId);
  Future<Either<ErrorModel, void>> getHomeBanners();
  Future<Either<ErrorModel, void>> getHomeBrands();
  Future<Either<ErrorModel, OffersModel>> getHomeOffers();
}

class HomeApiServiceImpl implements HomeApiService {
  final ApiConsumer api;
  HomeApiServiceImpl(this.api);
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
  Future<Either<ErrorModel, List<CategoryModel>>> getHomeCategories() async {
    try {
      final response = await api.get('user/categories/1');
      List data = response['message'];

      final categories =
          data.map((json) => CategoryModel.fromJson(json)).toList();
      return Right(categories);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }

  @override
  Future<Either<ErrorModel, void>> getHomeData() {
    // TODO: implement getHomeData
    throw UnimplementedError();
  }

  @override
  Future<Either<ErrorModel, OffersModel>> getHomeOffers() async {
    try {
      var response = await api.get('user/products');

      OffersModel offers = OffersModel.fromJson(response);
      return Right(offers);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }

  @override
  Future<Either<ErrorModel, CategoryModelDetail>> getHomeProducts(
    productid,
  ) async {
    try {
      final response = await api.get('user/categories/$productid/1');
      CategoryModelDetail data = CategoryModelDetail.fromJson(
        response['message'],
      );
      return Right(data);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }
}
