part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class GetProductCartLoading extends ProductState {}

final class GetProductCartSuccess extends ProductState {
  final ProductModel product;

  GetProductCartSuccess(this.product);
}

final class GetProductCartFail extends ProductState {
  final String error;

  GetProductCartFail(this.error);
}
