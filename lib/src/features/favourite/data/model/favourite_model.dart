class FavoriteModel {
  final int id;
  final String name;
  final int categoryId;
  final String price;
  final String? discountPrice;
  final int quantity;
  final String stockStatus;
  final String imagePath;
  final String createdAt;
  final String updatedAt;
  final bool isFavorite;

  FavoriteModel({
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
    required this.isFavorite,
  });

  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
      id: json['id'],
      name: json['name'],
      categoryId: json['category_id'],
      price: json['price'],
      discountPrice: json['discount_price'],
      quantity: json['quantity'],
      stockStatus: json['stock_status'],
      imagePath: json['image_path'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      isFavorite: json['is_favorite'],
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
      'created_at': createdAt,
      'updated_at': updatedAt,
      'is_favorite': isFavorite,
    };
  }
}

class FavoritesResponseModel {
  final bool hasFavorites;
  final List<FavoriteModel> favorites;

  FavoritesResponseModel({required this.hasFavorites, required this.favorites});

  factory FavoritesResponseModel.fromJson(Map<String, dynamic> json) {
    return FavoritesResponseModel(
      hasFavorites: json['has_favorites'],
      favorites:
          (json['favorites'] as List)
              .map((item) => FavoriteModel.fromJson(item))
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
