import 'package:flutter/material.dart';
import 'package:food_afro_bean/model/home_soup_card_model.dart';

class SoupCardProvider with ChangeNotifier {
  List<HomeSoupCardModel> allSoup = [
    HomeSoupCardModel(
      id: '1',
      image: 'assets/images/s1.jpg',
      title: 'Egusi soup',
      description:
          'Product description should be written in this available space.',
      fav: false,
    ),
    HomeSoupCardModel(
      id: '2',
      image: 'assets/images/s2.jpg',
      title: 'Ofe oha soup',
      description:
          'Product description should be written in this available space.',
      fav: false,
    ),
    HomeSoupCardModel(
      id: '3',
      image: 'assets/images/s3.jpg',
      title: 'Palm oil rice',
      description:
          'Product description should be written in this available space.',
      fav: false,
    ),
    HomeSoupCardModel(
      id: '4',
      image: 'assets/images/s4.jpg',
      title: 'Coconut rice',
      description:
          'Product description should be written in this available space.',
      fav: false,
    ),
  ];
  void isfavourite(String id) {
    var soup = allSoup.firstWhere((e) => e.id == id);
    soup.fav = !soup.fav;
    notifyListeners();
  }
}
