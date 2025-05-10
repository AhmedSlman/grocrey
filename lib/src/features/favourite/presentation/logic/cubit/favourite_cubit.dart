import 'package:bloc/bloc.dart'; 
import 'package:dio/dio.dart';
import 'package:grocery/core/data/api/api_consumer.dart';
import 'package:grocery/core/data/api/dio_consumer.dart';
import 'package:grocery/core/errors/exceptions.dart';
import 'package:grocery/src/features/favourite/data/model/favourite_model.dart';
import 'package:meta/meta.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(FavouriteInitial());
  final ApiConsumer api = DioConsumer(dio: Dio());
  getFavourite() async {
    try {
      var response = await api.get('user/my_favorites');
      FavoritesResponseModel favouriteModel = FavoritesResponseModel.fromJson(
        response,
      );
      emit(SuccessGetFavourite(favouriteModel));
    } on ServerException catch (e) {
      emit(FailGetFavourite(e.errorModel.message));
    }
  }

  bool isFvaourite = false;

  addToFavourite(product_id) async { 
    emit(LoadingAddToFavourite());
    try {
      final response = await api.post(
        'user/put_favorites',
        data: {'product_id': product_id},
      );
      emit(
        SuccessAddToFavourite(
          'Product added to favourites',
          isFavourite: isFvaourite = !isFvaourite,
        ),
      );
    } catch (e) {
      emit(FailAddToFavourite(e.toString()));
    }
  }
}
