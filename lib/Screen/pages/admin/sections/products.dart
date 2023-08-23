import 'package:flutter/material.dart';

class AdminProductPage extends StatelessWidget {
  const AdminProductPage({super.key});

  @override
  Widget build(BuildContext context) {
      var media = MediaQuery.of(context).size;
   return Container(
      width: media.width - 250,
      height: media.height,
      padding: const EdgeInsets.all(15),
    );
  }
}