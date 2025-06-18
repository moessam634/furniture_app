import '../../../home/model/home_model/product_model.dart';

class CartItemModel {
  final int id;
  final ProductModel product;
  final int quantity;

  CartItemModel({
    required this.id,
    required this.product,
    required this.quantity,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json['id'],
      product: ProductModel.fromJson(json['product']),
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product': product.toJson(),
      'quantity': quantity,
    };
  }

  CartItemModel copyWith({
    int? id,
    ProductModel? product,
    int? quantity,
  }) {
    return CartItemModel(
      id: id ?? this.id,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }

  double get totalPrice => double.parse(product.price) * quantity;
}