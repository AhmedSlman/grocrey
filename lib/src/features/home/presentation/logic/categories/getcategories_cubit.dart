import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:grocery/core/data/api/dio_consumer.dart';
import 'package:grocery/core/errors/error_model.dart';
import 'package:grocery/core/errors/exceptions.dart';
import 'package:grocery/src/features/home/data/model/category_model.dart';
import 'package:grocery/src/features/home/data/model/product_model.dart';
import 'package:grocery/src/features/home/data/remote/home_api_service.dart';
import 'package:grocery/src/features/home/data/remote/home_remote_data_source.dart';
import 'package:grocery/src/features/home/domain/repos/home_repo.dart';
import 'package:grocery/src/features/home/domain/usecases/categories_usecase.dart';
import 'package:grocery/src/features/home/domain/usecases/procuts_usecase.dart';
import 'package:meta/meta.dart';

part 'getcategories_state.dart';

class GetcategoriesCubit extends Cubit<GetcategoriesState> {
  GetcategoriesCubit() : super(GetcategoriesInitial());

  getCategories() async {
    emit(GetcategoriesLoading());
    final data = GetCategoriesUseCase(
      HomeRepoImpl(
        HomeRemoteDataSourceImpl(HomeApiServiceImpl(DioConsumer(dio: Dio()))),
      ),
    );

    try {
      final result = await data.getCategories();
      result.fold(
        (failure) => emit(GetcategoriesFail(failure)),
        (success) => emit(GetcategoriesSuccess(success)),
      );
    } on ServerException catch (e) {
      emit(GetcategoriesFail(e.errorModel));
    }
  }

  getProducts(productId) async {
    final data = GetProductsUseCase(
      HomeRepoImpl(
        HomeRemoteDataSourceImpl(HomeApiServiceImpl(DioConsumer(dio: Dio()))),
      ),
    );
    try {
      final result = await data.getProducts(productId);
      result.fold(
        (failure) => emit(GetProductsFail(failure)),
        (success) => emit(GetProductsSuccess(success)),
      );
    } on ServerException catch (e) {
      emit(GetProductsFail(e.errorModel));
    }
  }
}
