part of 'getcategories_cubit.dart';

@immutable
sealed class GetcategoriesState {}

final class GetcategoriesInitial extends GetcategoriesState {}

final class GetcategoriesLoading extends GetcategoriesState {}

final class GetcategoriesSuccess extends GetcategoriesState {
  final List<CategoryModel> categorymodel;
  GetcategoriesSuccess(this.categorymodel);
}

final class GetcategoriesFail extends GetcategoriesState {
  final ErrorModel errorModel;
  GetcategoriesFail(this.errorModel);
}

final class GetProductsLoading extends GetcategoriesState {}

final class GetProductsSuccess extends GetcategoriesState {
  final CategoryModelDetail categorymodel;
  GetProductsSuccess(this.categorymodel);
}

final class GetProductsFail extends GetcategoriesState {
  final ErrorModel errorModel;
  GetProductsFail(this.errorModel);
}
