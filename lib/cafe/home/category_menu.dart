import 'package:flutter/material.dart';
import '../../models/item.dart';
import 'list_view.dart';

class CategoryMenuPage extends StatelessWidget {
  const CategoryMenuPage({super.key, required this.category, required this.items});
  final String category;
  final List<CafeItem> items;

  @override
  Widget build(BuildContext context) {
    List<CafeItem> filteredItems = items.where((item) => item.category == category).toList();
    return filteredItems.isNotEmpty ? 
    Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              PopularListView(items: filteredItems,),
            ],
          ),
        ),
      ),
    ): Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: Center(child:Text('No item for $category')));
  }
}