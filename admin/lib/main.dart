import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:admin/screens/screens.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SoFood Backend',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      getPages: [
      GetPage(name: '/products', page: () => ProductsScreen()),
      GetPage(name: '/products/new', page: () => NewProductsScreen()),
      ]
    );
  }
}

