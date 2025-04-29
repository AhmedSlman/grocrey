import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:grocery/core/data/api/api_consumer.dart';
import 'package:grocery/core/data/api/dio_consumer.dart';
import 'package:grocery/src/features/cart/data/model/cart_model.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  final ApiConsumer api = DioConsumer(dio: Dio());
  int quantity = 1;

  addToCart(bool isSilent) async {
    !isSilent ? emit(AddCartLoading()) : null;

    try {
      quantity++;
      await api.post('user/cart/1', data: {'product_id': '2', 'quantity': 1});

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
}
