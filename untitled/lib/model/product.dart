import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;

  Product({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.isRecommended,
    required this.isPopular,
  });
  @override
  List<Object?> get props =>
      [name, category, imageUrl, price, isRecommended, isPopular];

  static List<Product> products = [
    Product(
        name: "Soft Drink #1",
        category: 'Soft Drink',
        imageUrl:
            'https://toplist.vn/images/800px/tocotoco-nhu-quynh-hung-yen-446022.jpg',
        price: 21.0,
        isRecommended: true,
        isPopular: false),
    Product(
        name: "Soft Drink #2",
        category: 'Soft Drink',
        imageUrl:
            'https://d1sag4ddilekf6.azureedge.net/compressed/items/5-CZE2APCDRNJKNX-CZE2APCXGLCCE6/photo/menueditor_item_b28196215ea547548d1939c1f05effed_1589951161698461628.jpg',
        price: 19.0,
        isRecommended: false,
        isPopular: true),
    Product(
        name: "Smoothies #1",
        category: 'Smoothies',
        imageUrl:
            'https://trasuawanfotea.com/wp-content/uploads/2020/07/san-pham-1.jpg',
        price: 23.0,
        isRecommended: true,
        isPopular: true),
    Product(
        name: "Smoothies #2",
        category: 'Smoothies',
        imageUrl:
            'https://jarvis.vn/wp-content/uploads/2019/05/dau-da-xay-3.jpg',
        price: 22.0,
        isRecommended: true,
        isPopular: false),
    Product(
        name: "Smoothies #3",
        category: 'Smoothies',
        imageUrl:
            'https://d1sag4ddilekf6.azureedge.net/compressed_webp/items/VNITE2021051117211990262/detail/menueditor_item_910bd1f5dcfd4983a34bb4ccb754fc4d_1620753580055398347.webp',
        price: 21.0,
        isRecommended: true,
        isPopular: true),
    Product(
        name: "Water #3",
        category: 'Water',
        imageUrl:
            'https://cachnauche.com/uploads/c15-tra-sua-khoai-mon.png',
        price: 18.0,
        isRecommended: false,
        isPopular: false),
    Product(
        name: "Water #1",
        category: 'Water',
        imageUrl:
            'https://quancaphe.vn/wp-content/uploads/2022/01/img_61d834f3c29b2.png',
        price: 17.0,
        isRecommended: false,
        isPopular: true),
    Product(
        name: "Water #2",
        category: 'Water',
        imageUrl:
            'https://phucgiaan.com/wp-content/uploads/2022/03/pudding-tra-sua-thai-xanh-anansteacake-20k-300x300.jpg',
        price: 20.0,
        isRecommended: false,
        isPopular: true),
    Product(
        name: "Soft Drink #4",
        category: 'Soft Drink',
        imageUrl:
            'https://toplist.vn/images/800px/milk-tea-land-tra-sua-dinh-duong-516565.jpg',
        price: 12.0,
        isRecommended: true,
        isPopular: true),
  ];
}
