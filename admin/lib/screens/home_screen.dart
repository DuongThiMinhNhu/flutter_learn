import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:admin/screens/screens.dart';
class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SoFood'),
        backgroundColor: Colors.black,
      ),
      body: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           Container(
             width: double.infinity,
             height: 150,
             padding: EdgeInsets.symmetric(horizontal: 10),
             child: InkWell(
               onTap: (){
                 Get.to(()=>ProductsScreen());
               },
               child: Card(
                 child: Center(
                   child: Text('Go to Products'),
                 ),
               ),
             ),
           )
          ],
        ),
      )
    );
  }

}