part of 'product_bloc.dart';
class ProductEvent extends Equatable {
  const ProductEvent();
  @override
  List<Object?> get props => [];
}

class LoadProducts extends ProductEvent {}

class UpdateProducts extends ProductEvent {
  final List<Productt> products;
  UpdateProducts({required this.products});
  @override
  List<Object?> get props => [products];
}
