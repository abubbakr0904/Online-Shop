class LocationModel {
  final String longdute;
  final String lottidute;
  final String category;
  final String categoryImageUrl;

  LocationModel({
    required this.longdute,
    required this.lottidute,
    required this.category,
    required this.categoryImageUrl,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
        longdute: json["longdute"],
        lottidute: json["lottidute"],
        category: json["category"],
        categoryImageUrl: json["category_image_url"]);
  }
}
