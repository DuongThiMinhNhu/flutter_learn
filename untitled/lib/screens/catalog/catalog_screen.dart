import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:untitled/widgets/widgets.dart';

import 'package:untitled/model/model.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';
  static Route route({required Categorys category}) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => CatalogScreen(category: category),
    );
  }

  final Categorys category;
  const CatalogScreen({required this.category});
  @override
  Widget build(BuildContext context) {
    final List<Productt> categoryProducts = Productt.products.where((product) => product.category == category.name).toList();
    return Scaffold(
      appBar: CustomAppBar(
        title: category.name,
      ),
      bottomNavigationBar: CustomNavBar(screen: routeName,),
      body: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1.15),
        itemCount: categoryProducts.length,
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: ProductCart(product: categoryProducts[index],widthFactor: 2.2,),
          );
        },
      ),
    );
  }
}
