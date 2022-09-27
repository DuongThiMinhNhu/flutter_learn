import 'package:equatable/equatable.dart';
class Categorys extends Equatable{
  final String name;
  final String imageUrl;
   Categorys({
    required this.name,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [
    name,imageUrl,
  ];
  static List<Categorys> categories = [
    Categorys(name: "Soft Drink", imageUrl: "https://halotravel.vn/wp-content/uploads/2021/07/Huy%E1%BB%81n-Tr%C3%A0-S%E1%BB%AFa-1024x1024.jpg"),
    Categorys(name: "Smoothies", imageUrl: "https://cafefcdn.com/203337114487263232/2022/9/2/photo-1-1662078559798750581706.jpg"),
    Categorys(name: "Water", imageUrl: "https://icdn.dantri.com.vn/thumb_w/640/2018/8/17/photo-2-15344660253391589797590.jpg"),
  ];

}