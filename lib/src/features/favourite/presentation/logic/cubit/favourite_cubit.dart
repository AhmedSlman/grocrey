import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:grocery/core/data/api/api_consumer.dart';
import 'package:grocery/core/data/api/dio_consumer.dart';
import 'package:grocery/main.dart';
import 'package:grocery/src/features/favourite/data/model/favourite_model.dart';
import 'package:meta/meta.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(FavouriteInitial());
  final ApiConsumer api = DioConsumer(dio: Dio());
  bool isFavourite = false;
  getFavourite() async {
    try {
      var response = await api.get('user/my_favorites/1');
      FavouriteModel favouriteModel = FavouriteModel.fromJson(response);
      emit(SuccessGetFavourite(favouriteModel));
    } catch (e) {
      emit(FailGetFavourite());
    }
  }

  addToFavourite(product_id) async {
    emit(LoadingAddToFavourite());
    try {
      emit(SuccessAddToFavourite('Product added to favourites'));

      final response = await api.post(
        'user/put_favorites',
        data: {'product_id': product_id},
      );
    } catch (e) {
      emit(FailAddToFavourite(e.toString()));
    }
  }
}
