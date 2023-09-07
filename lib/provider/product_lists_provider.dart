import 'package:flutter/material.dart';
import 'package:food_afro_bean/model/cart_item.dart';
import 'package:food_afro_bean/model/product_display_card.dart';

class ProductListProvider with ChangeNotifier {
  List<ProductDisplayCard> allproducts = [
    ProductDisplayCard(
        id: '1',
        image: 'assets/images/bean.png',
        title: 'Beans',
        description:
            'Product description should be written in this available space.',
        price: 20,
        stars: 5,
        images: [
          'assets/images/garri.png',
          'assets/images/bean.png',
          'assets/images/bean.png',
          'assets/images/chin_chin.png',
          'assets/images/oil.png',
        ],
        favourite: false),
    ProductDisplayCard(
        id: '2',
        image: 'assets/images/garri.png',
        title: 'White ijebo garri',
        description:
            'Product description should be written in this available space.',
        price: 20,
        stars: 5,
        images: [
          'assets/images/garri.png',
          'assets/images/bean.png',
          'assets/images/bean.png',
          'assets/images/chin_chin.png',
          'assets/images/oil.png',
        ],
        favourite: false),
    ProductDisplayCard(
        id: '3',
        image: 'assets/images/chin_chin.png',
        title: 'Chin Chin',
        description:
            'Product description should be written in this available space.',
        price: 20,
        stars: 5,
        images: [
          'assets/images/garri.png',
          'assets/images/bean.png',
          'assets/images/bean.png',
          'assets/images/chin_chin.png',
          'assets/images/oil.png',
        ],
        favourite: false),
    ProductDisplayCard(
        id: '4',
        image: 'assets/images/oil.png',
        title: 'Palm Oil',
        description:
            'Product description should be written in this available space.',
        price: 20,
        stars: 4,
        images: [
          'assets/images/garri.png',
          'assets/images/bean.png',
          'assets/images/bean.png',
          'assets/images/chin_chin.png',
          'assets/images/oil.png',
        ],
        favourite: false),
    ProductDisplayCard(
        id: '5',
        image: 'assets/images/garri.png',
        title: 'White ijebo garri',
        description:
            'Product description should be written in this available space.',
        price: 20,
        stars: 3,
        images: [
          'assets/images/garri.png',
          'assets/images/bean.png',
          'assets/images/bean.png',
          'assets/images/chin_chin.png',
          'assets/images/oil.png',
        ],
        favourite: false),
    ProductDisplayCard(
        id: '6',
        image: 'assets/images/garri.png',
        title: 'White ijebo garri',
        description:
            'Product description should be written in this available space.',
        price: 20,
        stars: 2,
        images: [
          'assets/images/garri.png',
          'assets/images/bean.png',
          'assets/images/bean.png',
          'assets/images/chin_chin.png',
          'assets/images/oil.png',
        ],
        favourite: false),
    ProductDisplayCard(
        id: '7',
        image: 'assets/images/garri.png',
        title: 'White ijebo garri',
        description:
            'Product description should be written in this available space.',
        price: 20,
        stars: 1,
        images: [
          'assets/images/garri.png',
          'assets/images/bean.png',
          'assets/images/bean.png',
          'assets/images/chin_chin.png',
          'assets/images/oil.png',
        ],
        favourite: false),
    ProductDisplayCard(
        id: '8',
        image: 'assets/images/garri.png',
        title: 'White ijebo garri',
        description:
            'Product description should be written in this available space.',
        price: 20,
        stars: 1,
        images: [
          'assets/images/garri.png',
          'assets/images/bean.png',
          'assets/images/bean.png',
          'assets/images/chin_chin.png',
          'assets/images/oil.png',
        ],
        favourite: false),
    ProductDisplayCard(
        id: '9',
        image: 'assets/images/garri.png',
        title: 'White ijebo garri',
        description:
            'Product description should be written in this available space.',
        price: 20,
        stars: 1,
        images: [
          'assets/images/garri.png',
          'assets/images/bean.png',
          'assets/images/bean.png',
          'assets/images/chin_chin.png',
          'assets/images/oil.png',
        ],
        favourite: false),
    ProductDisplayCard(
        id: '10',
        image: 'assets/images/garri.png',
        title: 'White ijebo garri',
        description:
            'Product description should be written in this available space.',
        price: 20,
        stars: 1,
        images: [
          'assets/images/garri.png',
          'assets/images/bean.png',
          'assets/images/bean.png',
          'assets/images/chin_chin.png',
          'assets/images/oil.png',
        ],
        favourite: false),
    ProductDisplayCard(
        id: '11',
        image: 'assets/images/garri.png',
        title: 'White ijebo garri',
        description:
            'Product description should be written in this available space.',
        price: 20,
        stars: 1,
        images: [
          'assets/images/garri.png',
          'assets/images/bean.png',
          'assets/images/bean.png',
          'assets/images/chin_chin.png',
          'assets/images/oil.png',
        ],
        favourite: false),
    ProductDisplayCard(
        id: '12',
        image: 'assets/images/garri.png',
        title: 'White ijebo garri',
        description:
            'Product description should be written in this available space.',
        price: 20,
        stars: 1,
        images: [
          'assets/images/garri.png',
          'assets/images/bean.png',
          'assets/images/bean.png',
          'assets/images/chin_chin.png',
          'assets/images/oil.png',
        ],
        favourite: false),
    ProductDisplayCard(
        id: '13',
        image: 'assets/images/garri.png',
        title: 'White ijebo garri',
        description:
            'Product description should be written in this available space.',
        price: 20,
        stars: 1,
        images: [
          'assets/images/garri.png',
          'assets/images/bean.png',
          'assets/images/bean.png',
          'assets/images/chin_chin.png',
          'assets/images/oil.png',
        ],
        favourite: false),
  ];

  List<ProductDisplayCard> mostRequestedProducts = [
    ProductDisplayCard(
        id: 'id1',
        image: 'assets/images/garri.png',
        title: 'White ijebo garri',
        description:
            'Product description should be written in this available space.',
        price: 20,
        stars: 5,
        favourite: false),
    ProductDisplayCard(
        id: 'id2',
        image: 'assets/images/garri.png',
        title: 'White ijebo garri',
        description:
            'Product description should be written in this available space.',
        price: 20,
        stars: 5,
        favourite: false),
    ProductDisplayCard(
        id: 'id3',
        image: 'assets/images/garri.png',
        title: 'White ijebo garri',
        description:
            'Product description should be written in this available space.',
        price: 20,
        stars: 5,
        favourite: false),
    ProductDisplayCard(
        id: 'id4',
        image: 'assets/images/garri.png',
        title: 'White ijebo garri',
        description:
            'Product description should be written in this available space.',
        price: 20,
        stars: 4,
        favourite: false),
  ];

  List<CartItemModel> usercart = [
    // ProductDisplayCard(
    //     id: 'id1',
    //     image: 'assets/images/garri.png',
    //     title: 'White ijebo garri',
    //     description:
    //         'Product description should be written in this available space.',
    //     price: 20,
    //     stars: 5,
    //     images: [
    //       'assets/images/garri.png',
    //       'assets/images/bean.png',
    //       'assets/images/bean.png',
    //       'assets/images/chin_chin.png',
    //       'assets/images/oil.png',
    //     ],
    //     favourite: false),
    // ProductDisplayCard(
    //     id: 'id2',
    //     image: 'assets/images/garri.png',
    //     title: 'White ijebo garri',
    //     description:
    //         'Product description should be written in this available space.',
    //     price: 20,
    //     stars: 5,
    //     images: [
    //       'assets/images/garri.png',
    //       'assets/images/bean.png',
    //       'assets/images/bean.png',
    //       'assets/images/chin_chin.png',
    //       'assets/images/oil.png',
    //     ],
    //     favourite: false),
    // ProductDisplayCard(
    //     id: 'id3',
    //     image: 'assets/images/garri.png',
    //     title: 'White ijebo garri',
    //     description:
    //         'Product description should be written in this available space.',
    //     price: 20,
    //     stars: 5,
    //     images: [
    //       'assets/images/garri.png',
    //       'assets/images/bean.png',
    //       'assets/images/bean.png',
    //       'assets/images/chin_chin.png',
    //       'assets/images/oil.png',
    //     ],
    //     favourite: false),
    // ProductDisplayCard(
    //     id: 'id4',
    //     image: 'assets/images/garri.png',
    //     title: 'White ijebo garri',
    //     description:
    //         'Product description should be written in this available space.',
    //     price: 20,
    //     stars: 4,
    //     images: [
    //       'assets/images/garri.png',
    //       'assets/images/bean.png',
    //       'assets/images/bean.png',
    //       'assets/images/chin_chin.png',
    //       'assets/images/oil.png',
    //     ],
    //     favourite: false),
  ];

  void isfavourite(String id) {
    var product = allproducts.firstWhere((e) => e.id == id);
    product.favourite = !product.favourite;

    notifyListeners();
  }

  ProductDisplayCard itemMatch(String id) {
    return allproducts.firstWhere((e) => e.id == id);
  }

  void removefromcart(String id) {
    usercart.removeWhere((e) => e.id == id);
    notifyListeners();
  }

  void addtocart(String id) {
    var product = allproducts.firstWhere((e) => e.id == id);
    var cartItem = CartItemModel(
      id: product.id,
      image: product.image,
      title: product.title,
      description: product.description,
      price: product.price,
      stars: product.stars,
      favourite: product.favourite,
      quantity: 1,
      totalPrice: product.price, // Set the total price as needed
    );

    usercart.add(cartItem);
    notifyListeners();
  }

  // total Amount in cart
  double totalamountInCart() {
    double total = 0.0;

    for (var e in usercart) {
      total = total + (e.price * e.quantity);
    }

    return total;
  }

  /// to add quantity
  void incrementCartItem(String id) {
    var cartitem = usercart.firstWhere((e) => e.id == id);

    cartitem.quantity += 1;

    // totalamountInCart();
    notifyListeners();
  }

  /// to decriment quantity
  void decrementCartItem(String id) {
    var cartitem = usercart.firstWhere((e) => e.id == id);
    if (cartitem.quantity != 0) {
      cartitem.quantity -= 1;
    }
    // totalamountInCart();
    notifyListeners();
  }

  void checkout() {
    usercart.clear();
    notifyListeners();
  }

  // void addtocart(String id) {
  //   usercart.add(

  //     allproducts.firstWhere((e) => e.id == id));
  //   notifyListeners();
  // }
}
