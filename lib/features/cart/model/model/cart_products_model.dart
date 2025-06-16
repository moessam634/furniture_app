import '../../../../core/styles/constants.dart';

class CartProductsModel {
  final int id;
  final int quantity;
  final String name;
  final String price;
  List<String>? images;


  CartProductsModel({
    required this.id,
    required this.quantity,
    required this.name,
    required this.price,
    required this.images,

  });

  factory CartProductsModel.fromJson(Map<String, dynamic> json) {
    final int productId = json["id"] ?? 0;
    final List<String> jsonImages = List<String>.from(json['images'] ?? []);
    final List<String> finalImages = jsonImages.isNotEmpty
        ? jsonImages
        : extraImages[productId] ?? [];
    return CartProductsModel(
      id: json['id'],
      quantity: json['quantity'],
      name: json['name'],
      price: json['price'], images: finalImages,
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
