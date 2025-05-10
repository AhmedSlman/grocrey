import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:grocery/core/data/api/api_consumer.dart';
import 'package:grocery/core/data/api/dio_consumer.dart';
import 'package:grocery/src/features/profile/data/data_source/profile_data_source.dart';
import 'package:grocery/src/features/profile/data/model/ordermodel.dart';
import 'package:grocery/src/features/profile/data/repositories/profile_repo_impl.dart';
import 'package:grocery/src/features/profile/domain/usecases/get_orders_use_case.dart';
import 'package:meta/meta.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());
  final usecase = GetOrdersUseCase(
    ProfileRepoImpl(ProfileDataSourceImpl(DioConsumer(dio: Dio()))),
  );
  void getOrders() async {
    emit(OrdersLoading());
    try {
      final result = await usecase.call();
      result.fold(
        (error) {
          emit(OrdersError(error.toString()));
        },
        (data) {
          emit(OrdersLoaded(data));
        },
      );
    } catch (e) {
      emit(OrdersError(e.toString()));
    }
  }
}
