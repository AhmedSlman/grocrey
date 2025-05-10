import 'package:dartz/dartz.dart';
import 'package:grocery/core/errors/error_model.dart';
import 'package:grocery/src/features/home/data/model/category_model_detail.dart';
import 'package:grocery/src/features/home/data/model/search_model.dart';
import 'package:grocery/src/features/home/domain/repos/home_repo.dart';

class GetSearchProductsUseCase {
  final HomeRepo homeRepo;
  GetSearchProductsUseCase(this.homeRepo);
  Future<Either<ErrorModel, SearchModel>> getProducts(String query) {
    return homeRepo.getSearchData(query);
  }
}
