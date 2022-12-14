part of 'cart_bloc.dart';
abstract class CartEvent extends Equatable{
  const CartEvent();
  @override
  List<Object> get props => [];
}
class CartStarted extends CartEvent{
  @override
  List<Object> get props => [];
}
class CartProductAdded extends CartEvent{
  final Productt product;
  const CartProductAdded({required this.product});
  @override
  List<Object> get props => [product];
}
class CartProductRemoved extends CartEvent{
  final Productt product;
  const CartProductRemoved({required this.product});
  @override
  List<Object> get props => [product];
}
