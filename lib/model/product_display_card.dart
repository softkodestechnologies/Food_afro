import 'dart:convert';

/// redo the json method this is just for show UI
class ProductDisplayCard {
  final String id;
  final String image;
  final String title;
  final String description;
  final double price;
  final double stars;
   bool favourite;
  ProductDisplayCard({
    required this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.stars,
    required this.favourite,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'image': image});
    result.addAll({'title': title});
    result.addAll({'description': description});
    result.addAll({'price': price});
    result.addAll({'stars': stars});
    result.addAll({'favourite': favourite});

    return result;
  }

  factory ProductDisplayCard.fromMap(Map<String, dynamic> map) {
    return ProductDisplayCard(
      id:  map['id'],
      image: map['image'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      stars: map['stars']?.toDouble() ?? 0.0,
      favourite: map['favourite'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductDisplayCard.fromJson(String source) =>
      ProductDisplayCard.fromMap(json.decode(source));
}
