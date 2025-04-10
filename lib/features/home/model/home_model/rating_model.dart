class RatingModel {
  final num? rate;
  final num? count;

  RatingModel({this.rate, this.count});

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      rate: json["rate"],
      count: json["count"],
    );
  }
}