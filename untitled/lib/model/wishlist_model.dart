import 'package:equatable/equatable.dart';
import 'package:untitled/model/model.dart';
class Wishlist extends Equatable{
  final List<Productt> products;
  const Wishlist({this.products = const<Productt>[]});
  @override
  List<Object?> get props => [products];
}