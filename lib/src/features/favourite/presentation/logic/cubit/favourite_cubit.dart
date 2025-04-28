import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:grocery/core/data/api/api_consumer.dart';
import 'package:grocery/core/data/api/dio_consumer.dart';
import 'package:meta/meta.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(FavouriteInitial());

  getFavourite() {}

  addToFavourite(product_id) async {
    final ApiConsumer api = DioConsumer(dio: Dio());
    final response = await api.post(
      'user/put_favorites',
      data: {'product_id': product_id},
    );
  }
}
