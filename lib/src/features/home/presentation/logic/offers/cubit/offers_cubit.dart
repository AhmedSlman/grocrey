import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:grocery/core/data/api/api_consumer.dart';
import 'package:grocery/core/data/api/dio_consumer.dart';
import 'package:grocery/core/errors/error_model.dart';
import 'package:grocery/src/features/home/data/model/offers_model.dart';
import 'package:grocery/src/features/home/presentation/logic/categories/getcategories_cubit.dart';
import 'package:meta/meta.dart';

part 'offers_state.dart';

class OffersCubit extends Cubit<OffersState> {
  OffersCubit() : super(OffersInitial());
  final ApiConsumer api = DioConsumer(dio: Dio());

  getOffers() async {
    try {
      var response = await api.get('user/products');

      OffersModel offers = OffersModel.fromJson(response);

      emit(GetOffersSuccess(offers.message ?? []));
    } catch (e) {
      emit(GetOffersFail(ErrorModel(message: 'Failed to load offers')));
    }
  }
}
