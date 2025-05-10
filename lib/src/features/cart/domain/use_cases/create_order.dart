import 'package:dartz/dartz.dart';
import 'package:grocery/core/errors/error_model.dart';
import 'package:grocery/src/features/cart/domain/repositories/cart_repositories.dart';

class CreateOrderUseCase {
  final CartRepositories cartRepository;

  CreateOrderUseCase(this.cartRepository);

  Future<Either<ErrorModel, void>> call(String total_price) async {
    return await cartRepository.createOrder(total_price);
  }
}
