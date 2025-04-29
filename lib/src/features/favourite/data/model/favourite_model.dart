class FavouriteModel {
  final bool hasFavorites;
  final List<FavoriteItem> favorites;

  FavouriteModel({required this.hasFavorites, required this.favorites});

  factory FavouriteModel.fromJson(Map<String, dynamic> json) {
    return FavouriteModel(
      hasFavorites: json['has_favorites'],
      favorites:
          (json['favorites'] as List)
              .map((item) => FavoriteItem.fromJson(item))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'has_favorites': hasFavorites,
      'favorites': favorites.map((item) => item.toJson()).toList(),
    };
  }
}

class FavoriteItem {
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

  FavoriteItem({
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

  factory FavoriteItem.fromJson(Map<String, dynamic> json) {
    return FavoriteItem(
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category_id': categoryId,
      'price': price,
      'discount_price': discountPrice,
      'quantity': quantity,
      'stock_status': stockStatus,
      'image_path': imagePath,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
