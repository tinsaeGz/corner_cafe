import 'package:corner_cafe/cafe/home/popular.dart';
import 'package:corner_cafe/cafe/home/specials.dart';
import 'package:flutter/material.dart';

import '../../models/item.dart';
import 'item_detail.dart';

class PopularListView extends StatelessWidget {
  final List<CafeItem> items;

  const PopularListView({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      primary: false,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Popular(onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemDetailPage(drink: items[index]),
                ));
              }, 
            item: items[index],),
        );
      },
    );
  }
}

class SpecialListView extends StatelessWidget {
  const SpecialListView({super.key, required this.items});

  final List<CafeItem> items; 

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      padding: EdgeInsets.zero,
      primary: false,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Specials(onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ItemDetailPage(drink: items[index]),
                  ));
                }, 
              item: items[index],),
          ),
        );
      },
    );
  }
}