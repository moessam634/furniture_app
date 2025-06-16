class CartModel {
  final String status;
  final String message;

  CartModel({required this.status, required this.message});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      status: json["status"],
      message: json["message"],
    );
  }
}

