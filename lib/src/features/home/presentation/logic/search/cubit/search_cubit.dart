import 'package:bloc/bloc.dart';
import 'package:grocery/core/errors/exceptions.dart';
import 'package:grocery/core/services/service_locator.dart';
import 'package:grocery/src/features/home/data/model/search_model.dart';

import 'package:grocery/src/features/home/domain/usecases/search_usecase.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  getProducts(productId) async {
    emit(SearchLoading());

    final usecase = getIt<GetSearchProductsUseCase>();
    try {
      final result = await usecase.getProducts(productId);
      result.fold(
        (failure) => emit(SearchFail(failure.message)),
        (success) => emit(SearchSuccess(success)),
      );
    } on ServerException catch (e) {
      emit(SearchFail(e.toString()));
    }
  }
}
