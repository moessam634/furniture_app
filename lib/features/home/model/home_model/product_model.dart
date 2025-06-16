import '../../../../core/styles/constants.dart';

class ProductModel {
  int? id;
  String? name;
  String? description;
  String? price;
  String? categoryName;
  List<String>? images;

  ProductModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.categoryName,
    this.images,
  });
  // factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
  //       id: json["id"],
  //       name: json["name"],
  //       description: json["description"],
  //       price: json["price"],
  //       categoryName: json['category_name']?.toString().trim() ?? '',
  //       images: List<String>.from(json['images'] ?? []),
  //     );
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final int productId = json["id"] ?? 0;
    final List<String> jsonImages = List<String>.from(json['images'] ?? []);
    final List<String> finalImages = jsonImages.isNotEmpty
        ? jsonImages
        : extraImages[productId] ?? [];
    return ProductModel(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      price: json["price"],
      categoryName: json['category_name']?.toString().trim() ?? '',
      images: finalImages,
    );
  }


  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "category_name": categoryName,
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((image) => image)),
      };
}
