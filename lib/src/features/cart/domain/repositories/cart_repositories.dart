import 'package:dartz/dartz.dart';
import 'package:grocery/core/errors/error_model.dart';

abstract class CartRepositories {
  Future<Either<ErrorModel, void>> createOrder(String total_price);
}
