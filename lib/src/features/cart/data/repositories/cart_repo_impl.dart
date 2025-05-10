import 'package:dartz/dartz.dart';
import 'package:grocery/core/errors/error_model.dart';
import 'package:grocery/src/features/cart/data/data_source/remote_datasource.dart';
import 'package:grocery/src/features/cart/domain/repositories/cart_repositories.dart';

class CartRepoImpl extends CartRepositories {
  final CartRemoteDataSource remoteDataSource;
  CartRepoImpl(this.remoteDataSource);
  @override
  Future<Either<ErrorModel, void>> createOrder(String totalPrice) async {
    return await remoteDataSource.createOrder(totalPrice);
  }
}
