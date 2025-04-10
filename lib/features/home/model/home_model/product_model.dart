// class HomeModel {
//   final int id;
//   final String title;
//   final num price;
//   final String description;
//   final String category;
//   final String image;
//   final HomeRatingModel homeRatingModel;
//
//   HomeModel({
//     required this.id,
//     required this.title,
//     required this.price,
//     required this.description,
//     required this.category,
//     required this.image,
//     required this.homeRatingModel,
//   });
//
//   factory HomeModel.fromJson(Map<String, dynamic> json) {
//     return HomeModel(
//       id: json["id"],
//       title: json["title"],
//       price: json["price"],
//       description: json["description"],
//       category: json["category"],
//       image: json["image"],
//       homeRatingModel: HomeRatingModel.fromJson(json["rating"]),
//     );
//   }
// }

// class HomeRatingModel {
//   final num rate;
//   final num count;
//
//   HomeRatingModel({required this.rate, required this.count});
//
//   factory HomeRatingModel.fromJson(Map<String, dynamic> json) {
//     return HomeRatingModel(rate: json["rate"], count: json["count"]);
//   }
// }

import 'dart:math';

import 'package:furniture_app/features/home/model/home_model/rating_model.dart';

class ProductModel {
  final int? id;
  final String? title;
  final num? price;
  final String? description;
  final String? category;
  final String? image;
  final RatingModel? ratingModel;

  ProductModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.ratingModel,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      title: json["title"],
      price: json["price"],
      description: json["description"],
      category: json["category"],
      image: json["image"],
      ratingModel:
          json["rating"] != null ? RatingModel.fromJson(json["rating"]) : null,
    );
  }
}

final Random random = Random();

List<ProductModel> shoes = [
  ProductModel(
    id: 1,
    price: 180,
    title: "Adidas Ultra Boost",
    description:
        "High-performance running shoe with Boost technology in the midsole for maximum energy and comfort.",
    image: "https://images.unsplash.com/photo-1608231387042-66d1773070a5",
    ratingModel: RatingModel(rate: random.nextDouble() * 4 + 1, count: 0),
  ),
  ProductModel(
    id: 2,
    price: 3289,
    title: "New Balance 530",
    description:
        "A classic running shoe that combines style with modern technology, featuring Abzorb shock absorption.",
    image: "https://images.unsplash.com/photo-1551107696-a4b0c5a0d9a2",
    ratingModel: RatingModel(rate: random.nextDouble() * 4 + 1, count: 0),
  ),
  ProductModel(
    id: 3,
    price: 949,
    title: "Asics Gel-Kayano 30",
    description:
        "Designed for excellent support and stability, equipped with Gel technology for shock absorption and a comfortable midsole.",
    image: "https://images.unsplash.com/photo-1562183241-b937e95585b6",
    ratingModel: RatingModel(rate: random.nextDouble() * 4 + 1, count: 0),
  ),
  ProductModel(
    id: 4,
    price: 250,
    title: "Reebok Classics Leather",
    description: "A classic leather shoe suitable for everyday outfits.",
    image: "https://images.unsplash.com/photo-1549298916-b41d501d3772",
    ratingModel: RatingModel(rate: random.nextDouble() * 4 + 1, count: 0),
  ),
  ProductModel(
    id: 5,
    price: 300,
    title: "Vans Old Skool",
    description:
        "A classic skateboarding shoe known for its attractive design and comfort.",
    image: "https://images.unsplash.com/photo-1525966222134-fcfa99b8ae77",
    ratingModel: RatingModel(rate: random.nextDouble() * 4 + 1, count: 0),
  ),
  ProductModel(
    id: 6,
    price: 200,
    title: "Converse Chuck Taylor",
    description: "A lightweight and easy-to-wear classic sneaker.",
    image: "https://images.unsplash.com/photo-1494496195158-c3becb4f2475",
    ratingModel: RatingModel(rate: random.nextDouble() * 4 + 1, count: 0),
  ),
  ProductModel(
    id: 7,
    price: 500,
    title: "Jordan 1",
    description: "A popular Nike sneaker known for its quality and style.",
    image: "https://images.unsplash.com/photo-1556906781-9a412961c28c",
    ratingModel: RatingModel(rate: random.nextDouble() * 4 + 1, count: 0),
  ),
  ProductModel(
    id: 8,
    price: 750,
    title: "Balenciaga Speed Trainer",
    description:
        "A trendy shoe featuring unique design and exceptional comfort.",
    image: "https://images.unsplash.com/photo-1587563871167-1ee9c731aefb",
    ratingModel: RatingModel(rate: random.nextDouble() * 4 + 1, count: 0),
  ),
  ProductModel(
    id: 9,
    price: 600,
    title: "Yeezy Boost 350",
    description:
        "A modern sneaker from Adidas in collaboration with Kanye West.",
    image: "https://images.unsplash.com/photo-1604671801908-6f0c6a092c05",
    ratingModel: RatingModel(rate: random.nextDouble() * 4 + 1, count: 0),
  ),
  ProductModel(
    id: 10,
    price: 400,
    title: "Puma RS-X",
    description: "A sporty shoe inspired by retro designs.",
    image: "https://images.unsplash.com/photo-1560769629-975ec94e6a86",
    ratingModel: RatingModel(rate: random.nextDouble() * 4 + 1, count: 0),
  ),
  ProductModel(
    id: 11,
    price: 550,
    title: "Dior B23",
    description: "A luxurious shoe with a sleek and modern design.",
    image: "https://images.unsplash.com/photo-1543508282-6319a3e2621f",
    ratingModel: RatingModel(rate: random.nextDouble() * 4 + 1, count: 0),
  ),
  ProductModel(
    id: 12,
    price: 220,
    title: "Skechers D-Lux",
    description: "A comfortable shoe perfect for daily activities.",
    image: "https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a",
    ratingModel: RatingModel(rate: random.nextDouble() * 4 + 1, count: 0),
  ),
  ProductModel(
    id: 13,
    price: 380,
    title: "Salomon Speedcross",
    description: "A trail running shoe designed for rough terrains.",
    image: "https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa",
    ratingModel: RatingModel(rate: random.nextDouble() * 4 + 1, count: 0),
  ),
  ProductModel(
    id: 14,
    price: 160,
    title: "Nike Air Force 1",
    description:
        "A timeless classic known for its clean design and superior comfort.",
    image: "https://images.unsplash.com/photo-1514989940723-e8e51635b782",
    ratingModel: RatingModel(rate: random.nextDouble() * 4 + 1, count: 0),
  ),
  ProductModel(
    id: 15,
    price: 230,
    title: "Nike Air Jordan 4",
    description:
        "Iconic basketball shoe with unique design elements and premium materials.",
    image: "https://images.unsplash.com/photo-1607853202273-797f1c22a38e",
    ratingModel: RatingModel(rate: random.nextDouble() * 4 + 1, count: 0),
  ),
];
