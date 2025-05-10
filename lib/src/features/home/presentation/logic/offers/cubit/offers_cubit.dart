import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:grocery/core/data/api/api_consumer.dart';
import 'package:grocery/core/data/api/dio_consumer.dart';
import 'package:grocery/core/errors/error_model.dart';
import 'package:grocery/core/errors/exceptions.dart';
import 'package:grocery/src/features/home/data/model/offers_model.dart';
import 'package:grocery/src/features/home/data/remote/home_api_service.dart';
import 'package:grocery/src/features/home/data/remote/home_remote_data_source.dart';
import 'package:grocery/src/features/home/domain/repos/home_repo.dart';
import 'package:grocery/src/features/home/domain/usecases/offers_usecase.dart';
import 'package:meta/meta.dart';
part 'offers_state.dart';

class OffersCubit extends Cubit<OffersState> {
  OffersCubit() : super(OffersInitial());
  final ApiConsumer api = DioConsumer(dio: Dio());
  final data = GetOffersUseCase(
    HomeRepoImpl(
      HomeRemoteDataSourceImpl(HomeApiServiceImpl(DioConsumer(dio: Dio()))),
    ),
  );
  getOffers() async {
    try {
      var response = await data.getOffers();
      response.fold(
        (l) {
          emit(GetOffersFail(l));
        },
        (offers) {
          emit(GetOffersSuccess(offers.message ?? []));
        },
      );
    } on ServerException catch (e) {
      emit(GetOffersFail(ErrorModel(message: e.toString())));
    }
  }
}
