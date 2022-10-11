import 'dart:ffi';

import 'package:admin/controllers/product_controller.dart';
import 'package:admin/models/models.dart';
import 'package:admin/services/database_service.dart';
import 'package:admin/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class NewProductsScreen extends StatelessWidget {
  final ProductController productController = Get.find();
  StorageService storageService = StorageService();
  DatabaseService databaseService = DatabaseService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a Product'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 80,
                  child: Card(
                      margin: EdgeInsets.zero,
                      color: Colors.black,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () async {
                              ImagePicker _picker = ImagePicker();
                              final XFile? _image = await _picker.pickImage(
                                  source: ImageSource.gallery);
                              if (_image == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('No image was selected'),
                                  ),
                                );
                              }
                              if (_image != null) {
                                await storageService.uploadImage(_image);
                                var imageUrl = await storageService
                                    .getDownloadURL(_image.name);
                                productController.newProduct.update(
                                    'imageUrl', (_) => imageUrl,
                                    ifAbsent: () => imageUrl);
                              }
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
                            child: const Text(
                              'Add a Image',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ],
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Product Information',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                _buildTextFormField('id', 'id', productController),
                _buildTextFormField('name', 'name', productController),
                _buildTextFormField(
                    'description', 'description', productController),
                _buildTextFormField(
                    'category', 'category', productController),
                SizedBox(
                  height: 10,
                ),
                _buildSlider('Price', 'price', productController,
                    productController.price),
                _buildSlider('Quantity', 'quantity', productController,
                    productController.quantity),
                _buildCheckBox('Recommended', 'isRecommended',
                    productController, productController.isRecommended),
                _buildCheckBox('Popular', 'isPopular', productController,
                    productController.isPopular),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      databaseService.addProduct(Product(
                          id: int.parse(productController.newProduct['id'] != null ? productController.newProduct['id'] : '0'),
                          name: productController.newProduct['name']  != null ? productController.newProduct['name'] : "rong" ,
                          category: productController.newProduct['category'] != null ? productController.newProduct['category'] : "rong",
                          description: productController.newProduct['description'] != null ? productController.newProduct['description'] : "rong",
                          imageUrl: productController.newProduct['imageUrl'] != null ? productController.newProduct['imageUrl'] : "rong",
                          isRecommended: productController.newProduct['isRecommended'] == 'false' ? false : true,
                          isPopular: productController.newProduct['isPopular'] == 'false' ? false : true,
                          price: productController.newProduct['price'] != null ? productController.newProduct['price'].toDouble() : 1,
                          quantity: productController.newProduct['quantity'] != null ? productController.newProduct['quantity'].toInt() : 0),
                      );
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.black),
                    child: const Text(
                      'Save',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField _buildTextFormField(
      String hintText, String name, ProductController productController) {
    return TextFormField(
      decoration: InputDecoration(hintText: hintText),
      onChanged: (value) {
        productController.newProduct
            .update(name, (value) => value, ifAbsent: () => value);
      },
    );
  }

  Row _buildSlider(String type, String name,
      ProductController productController, double? controlerValue) {
    return Row(
      children: [
        SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 1,
          child: Text(
            type,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 3,
          child: Slider(
            value: (controlerValue == null) ? 0 : controlerValue,
            min: 0,
            max: 50,
            divisions: 10,
            activeColor: Colors.black,
            inactiveColor: Colors.black12,
            onChanged: (value) {
              productController.newProduct
                  .update(name, (_) => value, ifAbsent: () => value);
            },
          ),
        ),
      ],
    );
  }

  Row _buildCheckBox(String type, String name,
      ProductController productController, bool? controlerValue) {
    return Row(
      children: [
        SizedBox(
          width: 125,
          child: Text(
            type,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Checkbox(
          value: (controlerValue == null) ? false : true,
          checkColor: Colors.black,
          activeColor: Colors.black12,
          onChanged: (value) {
            productController.newProduct
                .update(name, (_) => value, ifAbsent: () => value);
          },
        ),
      ],
    );
  }
}
