import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:grocery/core/data/api/api_consumer.dart';
import 'package:grocery/core/data/api/dio_consumer.dart';
import 'package:grocery/src/features/cart/data/data_source/remote_datasource.dart';
import 'package:grocery/src/features/cart/data/model/cart_model.dart';
import 'package:grocery/src/features/cart/data/repositories/cart_repo_impl.dart';
import 'package:grocery/src/features/cart/domain/use_cases/create_order.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  final ApiConsumer api = DioConsumer(dio: Dio());
  int quantity = 1;

  addToCart(bool isSilent, String id) async {
    !isSilent ? emit(AddCartLoading()) : null;

    try {
      quantity++;
      await api.post('user/cart', data: {'product_id': id, 'quantity': 1});

      emit(AddCartSuccess(quantity));
    } catch (e) {
      emit(AddCartFail());
    }
  }

  CartModel? cart;

  getFromCart() async {
    emit(GetCartLoading());

    try {
      final rseponse = await api.get('user/cart');
      var data = rseponse;
      CartModel cart = CartModel.fromJson(data);

      emit(GetCartSuccess(cart));
    } catch (e) {
      emit(GetCartFail());
    }
  }

  deleteFromCart(String id) async {
    emit(DeleteCartLoading());

    try {
      await api.delete('user/cart/$id');
      getFromCart();
      emit(DeleteCartSuccess());
    } catch (e) {
      emit(DeleteCartFail());
    }
  }
  // final usecase = EditProfileUseCases(
  //   EditProfileRepoImpl(EditProfileDataSourceImpl(api)),

  final useCase = CreateOrderUseCase(
    CartRepoImpl(
      CartRemoteDataSourceImpl(apiConsumer: DioConsumer(dio: Dio())),
    ),
  );

  createOrder(String total_price) async {
    emit(CreateOrderLoading());

    try {
      final result = await useCase.call(total_price);
      result.fold(
        (error) => emit(CreateOrderFail(error.message)),
        (success) => emit(CreateOrderSuccess()),
      );
    } catch (e) {
      emit(CreateOrderFail(e.toString()));
    }
  }
}
