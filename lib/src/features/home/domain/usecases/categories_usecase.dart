import 'package:dartz/dartz.dart';
import 'package:grocery/core/errors/error_model.dart';
import 'package:grocery/src/features/home/data/model/category_model.dart';
import 'package:grocery/src/features/home/domain/repos/home_repo.dart';

class GetCategoriesUseCase {
  final HomeRepo homeRepo;
  GetCategoriesUseCase(this.homeRepo);
  Future<Either<ErrorModel, List<CategoryModel>>> getCategories() {
    return homeRepo.getHomeCategories();
  }
}
