part of 'wishlist_bloc.dart';
abstract class WishlisEvent extends Equatable{
  const WishlisEvent();
  @override
  List<Object?> get props => [];
}
class StartWishlist extends WishlisEvent{}
class AddWishlistProduct extends WishlisEvent{
  final Product product;
  const AddWishlistProduct(this.product);
  @override
  List<Object> get props => [product];
}
class RemoveWishlistProduct extends WishlisEvent{
 final Product product;
 const RemoveWishlistProduct(this.product);
 @override
 List<Object> get props => [product];
}