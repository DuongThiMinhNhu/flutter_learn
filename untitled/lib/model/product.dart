import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Productt extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;

  Productt({
    required this.category,
    required this.imageUrl,
    required this.isRecommended,
    required this.isPopular,
    required this.name,
    required this.price,
  });
  @override
  List<Object?> get props =>
      [category, imageUrl, isRecommended, isPopular,name, price,];

  static Productt fromSnapshot(DocumentSnapshot snap) {
    Productt product = Productt(
      name: snap['name'],
      category: snap['category'],
      imageUrl: snap['imageUrl'],
      price: snap['price'].toDouble(),
      isRecommended: snap['isRecommended'],
      isPopular: snap['isPopular'],
    );
    return product;
  }

  static List<Productt> products = [
    Productt(
        name: "Soft Drink #1",
        category: 'Soft Drink',
        imageUrl:
            'https://toplist.vn/images/800px/tocotoco-nhu-quynh-hung-yen-446022.jpg',
        price: 21.0,
        isRecommended: true,
        isPopular: false),
    Productt(
        name: "Soft Drink #2",
        category: 'Soft Drink',
        imageUrl:
            'https://d1sag4ddilekf6.azureedge.net/compressed/items/5-CZE2APCDRNJKNX-CZE2APCXGLCCE6/photo/menueditor_item_b28196215ea547548d1939c1f05effed_1589951161698461628.jpg',
        price: 19.0,
        isRecommended: false,
        isPopular: true),
    Productt(
        name: "Smoothies #1",
        category: 'Smoothies',
        imageUrl:
            'https://trasuawanfotea.com/wp-content/uploads/2020/07/san-pham-1.jpg',
        price: 23.0,
        isRecommended: true,
        isPopular: true),
    Productt(
        name: "Smoothies #2",
        category: 'Smoothies',
        imageUrl:
            'https://jarvis.vn/wp-content/uploads/2019/05/dau-da-xay-3.jpg',
        price: 22.0,
        isRecommended: true,
        isPopular: false),
    Productt(
        name: "Smoothies #3",
        category: 'Smoothies',
        imageUrl:
            'https://d1sag4ddilekf6.azureedge.net/compressed_webp/items/VNITE2021051117211990262/detail/menueditor_item_910bd1f5dcfd4983a34bb4ccb754fc4d_1620753580055398347.webp',
        price: 21.0,
        isRecommended: true,
        isPopular: true),
  ];
}
