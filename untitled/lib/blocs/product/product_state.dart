part of 'product_bloc.dart';
class ProductState extends Equatable{
  const ProductState();
  @override
  List<Object?> get props => [];
}
class ProductLoading extends ProductState{

}
class ProductLoaded extends ProductState{
  final List<Productt> products;
  ProductLoaded({this.products = const<Productt>[]});
 @override
  List<Object?> get props => [products];
}