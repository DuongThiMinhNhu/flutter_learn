import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/blocs/checkout/checkout_bloc.dart';
import 'package:untitled/model/model.dart';

import '../blocs/cart/cart_bloc.dart';
import '../blocs/wishlist/wishlist_bloc.dart';

class CustomNavBar extends StatelessWidget {
  final String screen;
  final Productt? productt;
  const CustomNavBar({Key? key, required this.screen, this.productt})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: Container(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _selectNavBar(context, screen)!,
        ),
      ),
    );
  }

  List<Widget>? _selectNavBar(context, screen) {
    switch (screen) {
      case '/':
        return _buildNavBar(context);
      case '/catalog':
        return _buildNavBar(context);
      case '/wishlist':
        return _buildNavBar(context);
      case '/product':
        return _buildAddToCartNavBar(context,productt);
      case '/cart':
        return _buildGotoCheckoutNavBar(context);
      case '/checkout':
        return _buildOrderNowNavBar(context);
      default:
        _buildNavBar(context);
    }
  }


  List<Widget> _buildNavBar(context) {
    return [
      IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
          icon: Icon(
            Icons.home,
            color: Colors.white,
          )),
      IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/cart');
          },
          icon: Icon(
            Icons.shopping_cart,
            color: Colors.white,
          )),
      IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/user');
          },
          icon: Icon(
            Icons.person,
            color: Colors.white,
          )),
    ];
  }
  List<Widget> _buildAddToCartNavBar(context,product) {
    return  [
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.share),
        color: Colors.white,
      ),
      BlocBuilder<WishlistBloc, WishlistState>(
          builder: (context, state) {
            return IconButton(
              onPressed: () {
                context
                    .read<WishlistBloc>()
                    .add(AddWishlistProduct(product));
                final snackBar =
                SnackBar(content: Text("Added to your Wishlist!!"));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              icon: Icon(Icons.favorite),
              color: Colors.white,
            );
          }),
      BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.white),
                onPressed: () {
                  context.read<CartBloc>().add(CartProductAdded(product: product));
                  final snackBar =
                  SnackBar(content: Text("Added to product !!"));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Text(
                  'ADD TO CART',
                  style: Theme.of(context).textTheme.headline3!,
                ));
          }),
    ];
  }
  List<Widget> _buildGotoCheckoutNavBar(context) {
    return[
      ElevatedButton(
          onPressed: () {
          Navigator.pushNamed(context, '/checkout');
          },
          style: ElevatedButton.styleFrom(primary: Colors.white),
          child: Text(
            'GO TO CHECKOUT',
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(color: Colors.black),
          )),
    ];
  }
  List<Widget> _buildOrderNowNavBar(context) {
    return[
      BlocBuilder<CheckoutBloc,CheckoutState>(
        builder: (context,state){
          if(state is CheckoutLoading){
            return Center(child: CircularProgressIndicator(),);
          }
          if(state is CheckoutLoaded){
            return ElevatedButton(
                onPressed: () {
                  context.read<CheckoutBloc>().add(ConfirmCheckout(checkOut: state.checkout));
                },
                style: ElevatedButton.styleFrom(primary: Colors.white),
                child: Text(
                  'ORDER NOW',
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(color: Colors.black),
                ));
          }
          else{
            return Text("Loi");
          }
        },
      ),

    ];
  }
}
