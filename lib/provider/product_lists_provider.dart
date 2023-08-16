import 'package:flutter/material.dart';
import 'package:food_afro_bean/model/product_display_card.dart';

class ProductListProvider with ChangeNotifier {
  List<ProductDisplayCard> allproducts = [
    ProductDisplayCard(
        id: '1',
        image: 'assets/images/garri.png',
        title: 'White ijebo garri',
        description:
            'Product description should be written in this available space.',
        price: 20,
        stars: 5,
        favourite: false),
    ProductDisplayCard(
        id: '2',
        image: 'assets/images/garri.png',
        title: 'White ijebo garri',
        description:
            'Product description should be written in this available space.',
        price: 20,
        stars: 5,
        favourite: false),
    ProductDisplayCard(
        id: '3',
        image: 'assets/images/garri.png',
        title: 'White ijebo garri',
        description:
            'Product description should be written in this available space.',
        price: 20,
        stars: 5,
        favourite: false),
    ProductDisplayCard(
        id: '4',
        image: 'assets/images/garri.png',
        title: 'White ijebo garri',
        description:
            'Product description should be written in this available space.',
        price: 20,
        stars: 4,
        favourite: false),
    ProductDisplayCard(
        id: '5',
        image: 'assets/images/garri.png',
        title: 'White ijebo garri',
        description:
            'Product description should be written in this available space.',
        price: 20,
        stars: 3,
        favourite: false),
    ProductDisplayCard(
        id: '6',
        image: 'assets/images/garri.png',
        title: 'White ijebo garri',
        description:
            'Product description should be written in this available space.',
        price: 20,
        stars: 2,
        favourite: false),
    ProductDisplayCard(
        id: '7',
        image: 'assets/images/garri.png',
        title: 'White ijebo garri',
        description:
            'Product description should be written in this available space.',
        price: 20,
        stars: 1,
        favourite: false),
  ];

  List<ProductDisplayCard> mostRequestedProducts = [
    ProductDisplayCard(
        id: '1',
        image: 'assets/images/garri.png',
        title: 'White ijebo garri',
        description:
            'Product description should be written in this available space.',
        price: 20,
        stars: 5,
        favourite: false),
    ProductDisplayCard(
        id: '2',
        image: 'assets/images/garri.png',
        title: 'White ijebo garri',
        description:
            'Product description should be written in this available space.',
        price: 20,
        stars: 5,
        favourite: false),
    ProductDisplayCard(
        id: '3',
        image: 'assets/images/garri.png',
        title: 'White ijebo garri',
        description:
            'Product description should be written in this available space.',
        price: 20,
        stars: 5,
        favourite: false),
    ProductDisplayCard(
        id: '4',
        image: 'assets/images/garri.png',
        title: 'White ijebo garri',
        description:
            'Product description should be written in this available space.',
        price: 20,
        stars: 4,
        favourite: false),
  ];

  List<ProductDisplayCard> usercart = [];

  void addtocart(String id) {
    usercart.add(allproducts.firstWhere((e) => e.id == id));
    notifyListeners();
  }

  void isfavourite(String id) {
    var product = allproducts.firstWhere((e) => e.id == id);
    var mostR = mostRequestedProducts.firstWhere((e) => e.id == id);
    product.favourite = !product.favourite;
    mostR.favourite = !mostR.favourite;
    print('working');
    notifyListeners();
  }
}
