class ProductModel {
  final int id;
  final String name;
  final String price;
  final int quantity;
  final List<String> images;
  final int categoryId;
  final String description;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.images,
    required this.categoryId,
    this.description = '',
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      quantity: json['quantity'],
      images: List<String>.from(json['images']),
      categoryId: json['categoryId'],
      description: json['description'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'quantity': quantity,
      'images': images,
      'categoryId': categoryId,
      'description': description,
    };
  }

  ProductModel copyWith({
    String? id,
    String? name,
    String? price,
    int? quantity,
    List<String>? images,
    String? categoryId,
    String? description,
  }) {
    return ProductModel(
      id:  this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      images: images ?? this.images,
      categoryId:  this.categoryId,
      description: description ?? this.description,
    );
  }
}