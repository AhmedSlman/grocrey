class CategoryModelDetail {
  final int id;
  final String name;
  final String description;
  final String imagePath;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<ProductModel> products;

  CategoryModelDetail({
    required this.id,
    required this.name,
    required this.description,
    required this.imagePath,
    required this.createdAt,
    required this.updatedAt,
    required this.products,
  });

  factory CategoryModelDetail.fromJson(Map<String, dynamic> json) {
    return CategoryModelDetail(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      imagePath: json['image_path'].trim() ?? '',
      createdAt: DateTime.parse(
        json['created_at'] ?? DateTime.now().toString(),
      ),
      updatedAt: DateTime.parse(
        json['updated_at'] ?? DateTime.now().toString(),
      ),
      products:
          (json['products'] as List<dynamic>)
              .map((product) => ProductModel.fromJson(product))
              .toList(),
    );
  }
}

class ProductModel {
  final int id;
  final String name;
  final int categoryId;
  final String price;
  final String? discountPrice;
  final int quantity;
  final String stockStatus;
  final String imagePath;
  final DateTime createdAt;
  final DateTime updatedAt;

  ProductModel({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.price,
    this.discountPrice,
    required this.quantity,
    required this.stockStatus,
    required this.imagePath,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      categoryId: json['category_id'] ?? 0,
      price: json['price'] ?? '0',
      discountPrice: json['discount_price'] ?? '0',
      quantity: json['quantity'] ?? 0,
      stockStatus: json['stock_status'] ?? '',
      imagePath: json['image_path'].trim() ?? '',
      createdAt: DateTime.parse(
        json['created_at'] ?? DateTime.now().toString(),
      ),
      updatedAt: DateTime.parse(
        json['updated_at'] ?? DateTime.now().toString(),
      ),
    );
  }
}
