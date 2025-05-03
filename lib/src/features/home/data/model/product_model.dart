class ProductModel {
  final bool isFavorite;
  final Product product;
  final String message;
  final List<Product> relatedProducts;

  ProductModel({
    required this.isFavorite,
    required this.product,
    required this.message,
    required this.relatedProducts,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      isFavorite: json['is_favorite'],
      product: Product.fromJson(json['product']),
      message: json['message'],
      relatedProducts:
          (json['related_products'] as List)
              .map((e) => Product.fromJson(e))
              .toList(),
    );
  }
}

class Product {
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

  Product({
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

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      categoryId: json['category_id'],
      price: json['price'],
      discountPrice: json['discount_price'],
      quantity: json['quantity'],
      stockStatus: json['stock_status'],
      imagePath: json['image_path'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
