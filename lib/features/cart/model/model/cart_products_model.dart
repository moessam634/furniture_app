
class CartProductsModel {
  final int id;
  final int quantity;
  final String name;
  final String price;



  CartProductsModel({
    required this.id,
    required this.quantity,
    required this.name,
    required this.price,
  });

  factory CartProductsModel.fromJson(Map<String, dynamic> json) {

    return CartProductsModel(
      id: json['id'] ?? 0,
      quantity: json['quantity'],
      name: json['name'],
      price: json['price'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'quantity': quantity,
      'name': name,
      'price': price,

    };
  }
}
