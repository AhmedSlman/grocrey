import 'package:bloc/bloc.dart';

import 'package:grocery/core/errors/error_model.dart';
import 'package:grocery/core/errors/exceptions.dart';
import 'package:grocery/core/services/service_locator.dart';
import 'package:grocery/src/features/home/data/model/category_model.dart';
import 'package:grocery/src/features/home/data/model/category_model_detail.dart';

import 'package:grocery/src/features/home/domain/usecases/categories_usecase.dart';
import 'package:grocery/src/features/home/domain/usecases/procuts_usecase.dart';
import 'package:meta/meta.dart';

part 'getcategories_state.dart';

class GetcategoriesCubit extends Cubit<GetcategoriesState> {
  GetcategoriesCubit() : super(GetcategoriesInitial());

  getCategories() async {
    emit(GetcategoriesLoading());

    final usecase = getIt<GetCategoriesUseCase>();
    try {
      final result = await usecase.getCategories();
      result.fold(
        (failure) => emit(GetcategoriesFail(failure)),
        (success) => emit(GetcategoriesSuccess(success)),
      );
    } on ServerException catch (e) {
      emit(GetcategoriesFail(e.errorModel));
    }
  }

  getProducts(productId) async {
    final usecase = getIt<GetProductsUseCase>();
    try {
      final result = await usecase.getProducts(productId);
      result.fold(
        (failure) => emit(GetProductsFail(failure)),
        (success) => emit(GetProductsSuccess(success)),
      );
    } on ServerException catch (e) {
      emit(GetProductsFail(e.errorModel));
    }
  }
}
