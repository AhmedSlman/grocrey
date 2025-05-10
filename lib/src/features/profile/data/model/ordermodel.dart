class OrdersModel {
  final List<OrderModel> message;

  OrdersModel({required this.message});

  factory OrdersModel.fromJson(Map<String, dynamic> json) {
    return OrdersModel(
      message: List<OrderModel>.from(
        json['message'].map((item) => OrderModel.fromJson(item)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {'message': message.map((order) => order.toJson()).toList()};
  }
}

class OrderModel {
  final int id;
  final int userId;
  final String totalPrice;
  final String deliveryPrice;
  final String orderStatus;
  final String orderDate;
  final String? paymobProductUrl;
  final int payStatus;
  final int payType;
  final String createdAt;
  final String updatedAt;

  OrderModel({
    required this.id,
    required this.userId,
    required this.totalPrice,
    required this.deliveryPrice,
    required this.orderStatus,
    required this.orderDate,
    this.paymobProductUrl,
    required this.payStatus,
    required this.payType,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      userId: json['user_id'],
      totalPrice: json['total_price'],
      deliveryPrice: json['delivery_price'],
      orderStatus: json['order_status'],
      orderDate: json['order_date'],
      paymobProductUrl: json['paymob_product_url'],
      payStatus: json['pay_status'],
      payType: json['pay_type'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'total_price': totalPrice,
      'delivery_price': deliveryPrice,
      'order_status': orderStatus,
      'order_date': orderDate,
      'paymob_product_url': paymobProductUrl,
      'pay_status': payStatus,
      'pay_type': payType,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
