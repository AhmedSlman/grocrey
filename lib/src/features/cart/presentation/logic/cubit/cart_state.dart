part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class GetCartLoading extends CartState {}

final class GetCartSuccess extends CartState {
  final List<CartModel> cart;
  GetCartSuccess(this.cart);
}

final class GetCartFail extends CartState {}

///////////////////////////////////////////////

final class AddCartLoading extends CartState {}

final class AddCartSuccess extends CartState {
  final int qunatity;
  AddCartSuccess(this.qunatity);
}

final class AddCartFail extends CartState {}

///////////////////////////////////////////////
final class LoadingQuantity extends CartState {}

final class GetQunatity extends CartState {
  final int quantity;
  GetQunatity(this.quantity);
}
