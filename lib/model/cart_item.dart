import 'product_display_card.dart';

class CartItemModel extends ProductDisplayCard {
  int quantity;
  double totalPrice;

  CartItemModel({
    required super.id,
    required super.image,
    required super.title,
    required super.description,
    required super.price,
    required super.stars,
    required super.favourite,
   required this.quantity,
   required this.totalPrice,
  });
}
