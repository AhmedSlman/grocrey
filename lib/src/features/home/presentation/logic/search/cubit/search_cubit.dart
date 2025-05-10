import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:grocery/core/data/api/dio_consumer.dart';
import 'package:grocery/core/errors/exceptions.dart';
import 'package:grocery/src/features/home/data/model/search_model.dart';
import 'package:grocery/src/features/home/data/remote/home_api_service.dart';
import 'package:grocery/src/features/home/data/remote/home_remote_data_source.dart';
import 'package:grocery/src/features/home/domain/repos/home_repo.dart';
import 'package:grocery/src/features/home/domain/usecases/search_usecase.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  getProducts(productId) async {
    emit(SearchLoading());
    final data = GetSearchProductsUseCase(
      HomeRepoImpl(
        HomeRemoteDataSourceImpl(HomeApiServiceImpl(DioConsumer(dio: Dio()))),
      ),
    );

    try {
      final result = await data.getProducts(productId);
      result.fold(
        (failure) => emit(SearchFail(failure.message)),
        (success) => emit(SearchSuccess(success)),
      );
    } on ServerException catch (e) {
      emit(SearchFail(e.toString()));
    }
  }
}
