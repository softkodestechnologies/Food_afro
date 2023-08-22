// import 'dart:convert';

/// redo the json method this is just for show UI
class ProductDisplayCard {
  final String id;
  final String image;
  final String title;
  final String description;
  final String? details;
  final double price;
  final double? discountedPrice;
  final double stars;
  bool? discount;
  bool favourite;
  final List<String>? noOfReviews;
  final List<String>? images;
  final List<String>? keyFeatures;

  ProductDisplayCard({
    required this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    this.discountedPrice,
    required this.stars,
    this.discount,
    required this.favourite,
    this.keyFeatures,
    this.noOfReviews,
    this.images,
    this.details,
  });

  // Map<String, dynamic> toMap() {
  //   final result = <String, dynamic>{};

  //   result.addAll({'image': image});
  //   result.addAll({'title': title});
  //   result.addAll({'description': description});
  //   result.addAll({'price': price});
  //   result.addAll({'stars': stars});
  //   result.addAll({'favourite': favourite});

  //   return result;
  // }

  // factory ProductDisplayCard.fromMap(Map<String, dynamic> map) {
  //   return ProductDisplayCard(
  //     id:  map['id'],
  //     image: map['image'] ?? '',
  //     title: map['title'] ?? '',
  //     description: map['description'] ?? '',
  //     price: map['price']?.toDouble() ?? 0.0,
  //     stars: map['stars']?.toDouble() ?? 0.0,
  //     favourite: map['favourite'] ?? false,
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory ProductDisplayCard.fromJson(String source) =>
  //     ProductDisplayCard.fromMap(json.decode(source));
}
