class SearchModel {
  final bool success;
  final String message;
  final List<ProductSearchModel> data;

  SearchModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      success: json['success'],
      message: json['message'],
      data: List<ProductSearchModel>.from(
        json['data'].map((item) => ProductSearchModel.fromJson(item)),
      ),
    );
  }
}

class ProductSearchModel {
  final int id;
  final String name;
  final String price;
  final int categoryId;
  final bool isFavorite;
  final CategorySearchModel category;

  ProductSearchModel({
    required this.id,
    required this.name,
    required this.price,
    required this.categoryId,
    required this.isFavorite,
    required this.category,
  });

  factory ProductSearchModel.fromJson(Map<String, dynamic> json) {
    return ProductSearchModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      categoryId: json['category_id'],
      isFavorite: json['is_favorite'],
      category: CategorySearchModel.fromJson(json['category']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'category_id': categoryId,
      'is_favorite': isFavorite,
      'category': category.toJson(),
    };
  }
}

class CategorySearchModel {
  final int id;
  final String name;

  CategorySearchModel({required this.id, required this.name});

  factory CategorySearchModel.fromJson(Map<String, dynamic> json) {
    return CategorySearchModel(id: json['id'], name: json['name']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}
