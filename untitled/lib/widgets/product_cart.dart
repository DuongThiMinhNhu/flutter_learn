import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/blocs/cart/cart_bloc.dart';
import 'package:untitled/model/model.dart';

import '../blocs/wishlist/wishlist_bloc.dart';

class ProductCart extends StatelessWidget {
  final Product product;
  final double widthFactor;
  final double leftPosition;
  final bool isWishlist;
  const ProductCart(
      {Key? key,
      required this.product,
      this.widthFactor = 2.5,
      this.leftPosition = 5,
      this.isWishlist = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/product', arguments: product);
      },
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / widthFactor,
            height: 150,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 65,
            left: leftPosition + 5,
            child: Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width / widthFactor -
                  10 -
                  leftPosition,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(200),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.white),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          '\$${product.price}',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      if (state is CartLoading) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is CartLoaded) {
                        return Expanded(
                            child: IconButton(
                          onPressed: () {
                            context
                                .read<CartBloc>()
                                .add(CartProductAdded(product: product));
                            final snackBar =
                                SnackBar(content: Text("Added to product !!"));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                          icon: const Icon(
                            Icons.add_circle,
                            color: Colors.white,
                          ),
                        ));
                      } else {
                        return Text('Something went wrong');
                      }
                    },
                  ),
                  isWishlist
                      ? BlocBuilder<WishlistBloc, WishlistState>(
                          builder: (context, state) {
                          return Expanded(
                              child: IconButton(
                            onPressed: () {
                              context
                                  .read<WishlistBloc>()
                                  .add(RemoveWishlistProduct(product));
                              final snackBar =
                              SnackBar(content: Text("Remove to product Wishlist!!"));
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ));
                        })
                      : SizedBox(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
