part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class GetCartLoading extends CartState {}

final class GetCartSuccess extends CartState {
  final CartModel cart;
  GetCartSuccess(this.cart);
}

final class GetCartFail extends CartState {
  final String message;
  GetCartFail(this.message);
}

///////////////////////////////////////////////

final class AddCartLoading extends CartState {}

final class AddCartSuccess extends CartState {
  final int qunatity;
  AddCartSuccess(this.qunatity);
}

final class AddCartFail extends CartState {
  final String message;
  AddCartFail(this.message);
}

///////////////////////////////////////////////
final class LoadingQuantity extends CartState {}

final class GetQunatity extends CartState {
  final int quantity;
  GetQunatity(this.quantity);
}

////////////////////////////////////////////

final class DeleteCartLoading extends CartState {}

final class DeleteCartSuccess extends CartState {}

final class DeleteCartFail extends CartState {}

////////////////////////////////////////////

final class CreateOrderLoading extends CartState {}

final class CreateOrderSuccess extends CartState {}

final class CreateOrderFail extends CartState {
  final String message;
  CreateOrderFail(this.message);
}
