import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String name;
  final String category;
  final String description;
  final String imageUrl;
  final bool isRecommended;
  final bool isPopular;
  double price;
  int quantity;
  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.isRecommended,
    required this.isPopular,
    this.price = 0,
    this.quantity = 0,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        category,
        description,
        imageUrl,
        isRecommended,
        isPopular,
        price,
        quantity
      ];
  Product copyWith({
    int? id,
    String? name,
    String? category,
    String? description,
    String? imageUrl,
    bool? isRecommended,
    bool? isPopular,
    double? price,
    int? quantity,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      isRecommended: isRecommended ?? this.isRecommended,
      isPopular: isPopular ?? this.isPopular,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'description': description,
      'imageUrl': imageUrl,
      'isRecommended': isRecommended,
      'isPopular': isPopular,
      'price': price,
      'quantity': quantity,
    };
  }

  factory Product.fromSnapshot(DocumentSnapshot snap) {
    return Product(
        id: snap['id'],
        name: snap['name'],
        category: snap['category'],
        description: snap['description'],
        imageUrl: snap['imageUrl'],
        isRecommended: snap['isRecommended'],
        quantity: snap['quantity'],
        isPopular: snap['isPopular']);
  }
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;
  static List<Product> products = [
    Product(
        id: 1,
        name: "Soft Drink #1",
        category: 'Soft Drink',
        imageUrl:
            'https://toplist.vn/images/800px/tocotoco-nhu-quynh-hung-yen-446022.jpg',
        price: 21.0,
        description:
            'Doraemon is a fictional protagonist in the Manga series of the same name by artist Fujiko F. Fujio. In the story set in the 22nd century, Doraemon is the robot cat of the future that launches Matsushiba - a company specializing in manufacturing robots for the purpose of serving children.',
        isRecommended: true,
        isPopular: false),
    Product(
        id: 2,
        name: "Soft Drink #2",
        category: 'Soft Drink',
        imageUrl:
            'https://d1sag4ddilekf6.azureedge.net/compressed/items/5-CZE2APCDRNJKNX-CZE2APCXGLCCE6/photo/menueditor_item_b28196215ea547548d1939c1f05effed_1589951161698461628.jpg',
        price: 19.0,
        description:
            'Doraemon is a fictional protagonist in the Manga series of the same name by artist Fujiko F. Fujio. In the story set in the 22nd century, Doraemon is the robot cat of the future that launches Matsushiba - a company specializing in manufacturing robots for the purpose of serving children.',
        isRecommended: false,
        isPopular: true),
    Product(
        id: 3,
        name: "Smoothies #1",
        category: 'Smoothies',
        imageUrl:
            'https://trasuawanfotea.com/wp-content/uploads/2020/07/san-pham-1.jpg',
        price: 23.0,
        description:
            'Doraemon is a fictional protagonist in the Manga series of the same name by artist Fujiko F. Fujio. In the story set in the 22nd century, Doraemon is the robot cat of the future that launches Matsushiba - a company specializing in manufacturing robots for the purpose of serving children.',
        isRecommended: true,
        isPopular: true),
    Product(
        id: 4,
        name: "Smoothies #2",
        category: 'Smoothies',
        imageUrl:
            'https://jarvis.vn/wp-content/uploads/2019/05/dau-da-xay-3.jpg',
        price: 22.0,
        description:
            'Doraemon is a fictional protagonist in the Manga series of the same name by artist Fujiko F. Fujio. In the story set in the 22nd century, Doraemon is the robot cat of the future that launches Matsushiba - a company specializing in manufacturing robots for the purpose of serving children.',
        isRecommended: true,
        isPopular: false),
    Product(
        id: 5,
        name: "Smoothies #3",
        category: 'Smoothies',
        imageUrl:
            'https://d1sag4ddilekf6.azureedge.net/compressed_webp/items/VNITE2021051117211990262/detail/menueditor_item_910bd1f5dcfd4983a34bb4ccb754fc4d_1620753580055398347.webp',
        price: 21.0,
        description:
            'Doraemon is a fictional protagonist in the Manga series of the same name by artist Fujiko F. Fujio. In the story set in the 22nd century, Doraemon is the robot cat of the future that launches Matsushiba - a company specializing in manufacturing robots for the purpose of serving children.',
        isRecommended: true,
        isPopular: true),
  ];
}
