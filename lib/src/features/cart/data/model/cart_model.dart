class CartModel {
  final int id;
  final int productId;
  final int quantity;
  final String price;
  final int totalPrice;
  final String productName;
  final String productImage;

  CartModel({
    required this.id,
    required this.productId,
    required this.quantity,
    required this.price,
    required this.totalPrice,
    required this.productName,
    required this.productImage,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      productId: json['product_id'],
      quantity: json['quantity'],
      price: json['price'],
      totalPrice: json['total_price'],
      productName: json['product_name'],
      productImage: json['product_image'],
    );
  }
}
