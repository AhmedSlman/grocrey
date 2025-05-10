class ProductModel {
  final Product product;
  final String message;
  // final List<Product> relatedProducts;

  ProductModel({
    required this.product,
    required this.message,
    // required this.relatedProducts,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      product: Product.fromJson(json['product']),
      message: json['message'] ?? '',
      // relatedProducts:
      //     (json['related_products'] as List)
      //         .map((e) => Product.fromJson(e))
      //         .toList() ??
      //     [],
    );
  }
}

class Product {
  final int id;
  final String name;
  final int categoryId;
  final String price;
  final String discountPrice;
  final int quantity;
  final String stockStatus;
  final String imagePath;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isFavorite;

  Product({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.price,
    required this.discountPrice,
    required this.quantity,
    required this.stockStatus,
    required this.imagePath,
    required this.createdAt,
    required this.updatedAt,
    required this.isFavorite,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      categoryId: json['category_id'] ?? 0,
      price: json['price'] ?? '',
      discountPrice: json['discount_price'] ?? '0',
      quantity: json['quantity'] ?? 0,
      stockStatus: json['stock_status'] ?? '',
      imagePath: json['image_path'] ?? '',
      createdAt: DateTime.parse(json['created_at']) ?? DateTime.now(),
      updatedAt: DateTime.parse(json['updated_at']) ?? DateTime.now(),
      isFavorite: json['is_favorite'] ?? false,
    );
  }
}
