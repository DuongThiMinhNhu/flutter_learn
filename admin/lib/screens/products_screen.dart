import 'package:admin/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:admin/models/models.dart';
import 'package:get/get.dart';
import 'package:admin/screens/screens.dart';

class ProductsScreen extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Products'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              height: 80,
              child: Card(
                  margin: EdgeInsets.zero,
                  color: Colors.black,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.to(() => NewProductsScreen());
                        },
                        icon: const Icon(
                          Icons.add_circle,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => NewProductsScreen());
                        },
                        child: Text(
                          'Add a New Product',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ],
                  )),
            ),
            Expanded(
                child: Obx(() => ListView.builder(
                    itemCount: productController.products.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                            height: MediaQuery.of(context).size.height / 2.8,
                            child: ProductCard(
                              product: productController.products[index],
                              index: index,
                            ),
                          );
                    }))
            )
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  final int index;
  ProductCard({required this.product, required this.index});
  final ProductController productController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 10),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              product.description,
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  height: 80,
                  width: 80,
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                    child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Price',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Slider(
                            value: product.price,
                            min: 0,
                            max: 50,
                            divisions: 10,
                            activeColor: Colors.black,
                            inactiveColor: Colors.black12,
                            onChanged: (value) {
                              productController.updateProductPrice(
                                  index, product, value);
                            },
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            '\$${product.price.toStringAsFixed(1)}',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Qty.',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Slider(
                            value: product.quantity.toDouble(),
                            min: 0,
                            max: 100,
                            divisions: 10,
                            activeColor: Colors.black,
                            inactiveColor: Colors.black12,
                            onChanged: (value) {
                              productController.updateProductQuantity(
                                  index, product, value.toInt());
                            },
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            '${product.quantity.toInt()}',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
