import 'package:corner_cafe/cafe/home/detail.dart';
import 'package:corner_cafe/models/item.dart';
import 'package:flutter/material.dart';

class ItemDetailPage extends StatelessWidget {
  const ItemDetailPage({super.key, required this.drink});
  final CafeItem drink;

  @override
  Widget build(BuildContext context) {
    return  DetailWidget(name: drink.name, description: drink.description, imgUrl: drink.imageUrl, price: drink.price,);
  }
}
