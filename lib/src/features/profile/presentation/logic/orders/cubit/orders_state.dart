part of 'orders_cubit.dart';

@immutable
sealed class OrdersState {}

final class OrdersInitial extends OrdersState {}

final class OrdersLoading extends OrdersState {}

final class OrdersLoaded extends OrdersState {
  final OrdersModel ordersModel;

  OrdersLoaded(this.ordersModel);
}

final class OrdersError extends OrdersState {
  final String error;

  OrdersError(this.error);
}
