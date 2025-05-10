class OffersModel {
  final List<OfferProduct>? message;

  OffersModel({this.message});

  factory OffersModel.fromJson(Map<String, dynamic> json) {
    return OffersModel(
      message:
          json['message'] != null
              ? List<OfferProduct>.from(
                json['message'].map((x) => OfferProduct.fromJson(x)),
              )
              : [],
    );
  }
}

class OfferProduct {
  final int? id;
  final String? name;
  final int? categoryId;
  final String? price;
  final String? discountPrice;
  final int? quantity;
  final String? stockStatus;
  final String? imagePath;
  final String? createdAt;
  final String? updatedAt;
  final List<dynamic>? images;

  OfferProduct({
    this.id,
    this.name,
    this.categoryId,
    this.price,
    this.discountPrice,
    this.quantity,
    this.stockStatus,
    this.imagePath,
    this.createdAt,
    this.updatedAt,
    this.images,
  });

  factory OfferProduct.fromJson(Map<String, dynamic> json) {
    return OfferProduct(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      categoryId: json['category_id'] ?? 0,
      price: json['price'] ?? '',
      discountPrice: json['discount_price'] ?? '',
      quantity: json['quantity'] ?? 0,
      stockStatus: json['stock_status'] ?? '',
      imagePath: json['image_path'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      images: json['images'] ?? [],
    );
  }
}
