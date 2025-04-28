import 'dart:convert';

class CartModel {
  final List<CartItem> cart;
  final int total;

  CartModel({required this.cart, required this.total});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      cart:
          (json['cart'] as List<dynamic>?)
              ?.map((item) => CartItem.fromJson(item))
              .toList() ??
          [],
      total: json['total'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {'cart': cart.map((item) => item.toJson()).toList(), 'total': total};
  }
}

class CartItem {
  final int id;
  final int cartId;
  final int productId;
  final int quantity;
  final String price;
  final int totalPrice;
  final String createdAt;
  final String updatedAt;
  final String? productImage;
  final Product? product;

  CartItem({
    required this.id,
    required this.cartId,
    required this.productId,
    required this.quantity,
    required this.price,
    required this.totalPrice,
    required this.createdAt,
    required this.updatedAt,
    this.productImage,
    this.product,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'] ?? 0,
      cartId: json['cart_id'] ?? 0,
      productId: json['product_id'] ?? 0,
      quantity: json['quantity'] ?? 0,
      price: json['price']?.toString() ?? '0.0',
      totalPrice: json['total_price'] ?? 0,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      productImage: json['product_image'],
      product:
          json['product'] != null ? Product.fromJson(json['product']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cart_id': cartId,
      'product_id': productId,
      'quantity': quantity,
      'price': price,
      'total_price': totalPrice,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'product_image': productImage,
      'product': product?.toJson(),
    };
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
  final String createdAt;
  final String updatedAt;

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
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      categoryId: json['category_id'] ?? 0,
      price: json['price']?.toString() ?? '0.0',
      discountPrice: json['discount_price']?.toString(),
      quantity: json['quantity'] ?? 0,
      stockStatus: json['stock_status'] ?? '',
      imagePath: json['image_path'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
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
    };
  }
}
