// class CategoriesModel {
//   final String status;
//   final List<Categories> categories;
//
//   CategoriesModel({required this.status, required this.categories});
//
//   factory CategoriesModel.fromJson(Map<String, dynamic> json) {
//     return CategoriesModel(
//       status: json["status"],
//       categories: List<Categories>.from(
//         json["categories"].map(
//           (category) => Categories.fromJson(category),
//         ),
//       ),
//     );
//   }
// }
//
// class Categories {
//   final int id;
//   final String name;
//
//   Categories({required this.id, required this.name});
//
//   factory Categories.fromJson(Map<String, dynamic> json) {
//     return Categories(id: json["id"], name: json["name"]);
//   }
// }

class CategoryModel {
  final int id;
  final String name;

  CategoryModel({
    required this.id,
    required this.name,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
