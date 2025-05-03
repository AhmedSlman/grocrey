import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:grocery/core/data/api/api_consumer.dart';
import 'package:grocery/core/data/api/dio_consumer.dart';
import 'package:grocery/src/features/home/data/model/product_model.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  final ApiConsumer api = DioConsumer(dio: Dio());

  getProduct(index) async {
    emit(GetProductCartLoading());

    try {
      final rseponse = await api.get('/user/products/${index}');
      var data = rseponse;
      ProductModel product = ProductModel.fromJson(data);

      emit(GetProductCartSuccess(product));
    } catch (e) {
      emit(GetProductCartFail('failed to load product'));
    }
  }
}
