import 'package:dartz/dartz.dart';
import 'package:grocery/core/data/api/api_consumer.dart';
import 'package:grocery/core/errors/error_model.dart';
import 'package:grocery/core/errors/exceptions.dart';
import 'package:grocery/src/features/cart/data/model/cart_model.dart';

abstract class CartRemoteDataSource {
  Future<void> addToCart(String productId, int quantity);
  Future<void> removeFromCart(String productId);
  Future<void> updateCartItem(String productId, int quantity);
  Future<List<CartItem>> getCartItems();

  Future<Either<ErrorModel, void>> createOrder(String total_price);
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final ApiConsumer apiConsumer;

  CartRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<void> addToCart(String productId, int quantity) async {
    try {
      await apiConsumer.post(
        '/cart/add',
        data: {'product_id': productId, 'quantity': quantity},
      );
    } catch (e) {
      throw Exception('Failed to add item to cart: $e');
    }
  }

  @override
  Future<List<CartItem>> getCartItems() {
    // TODO: implement getCartItems
    throw UnimplementedError();
  }

  @override
  Future<void> removeFromCart(String productId) {
    // TODO: implement removeFromCart
    throw UnimplementedError();
  }

  @override
  Future<void> updateCartItem(String productId, int quantity) {
    // TODO: implement updateCartItem
    throw UnimplementedError();
  }

  @override
  Future<Either<ErrorModel, void>> createOrder(String total_price) async {
    try {
      var response = await apiConsumer.post(
        '/user/orders/1',
        data: {'total_price': total_price},
      );
      return Right(response);
    } on ServerException catch (e) {
      return Left(ErrorModel(message: e.errorModel.message));
    }
  }
}
