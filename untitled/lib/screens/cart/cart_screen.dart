import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/blocs/cart/cart_bloc.dart';
import 'package:untitled/widgets/widgets.dart';
import 'package:untitled/model/model.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';
  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => CartScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          title: "Cart",
        ),
        bottomNavigationBar: CustomNavBar(screen: routeName),
        body: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
          if (state is CartLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CartLoaded) {
               return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Cart().feeDeliveryString,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/');
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                shape: RoundedRectangleBorder(),
                                elevation: 0,
                              ),
                              child: Text(
                                'Add More Items',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(color: Colors.white),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 300,
                        child: ListView.builder(
                            itemCount: state.cart.productQuantity(state.cart.products).keys.length,
                            itemBuilder: (context, index) {
                              return CartProductCard(
                                product: state.cart.productQuantity(state.cart.products).keys.elementAt(index),
                                quantity: state.cart.productQuantity(state.cart.products).values.elementAt(index),
                              );
                            }),
                      ),
                      OrderSummary(),
                    ],
                  ),
            );
          }
          else {
            return Text('Something went wrong');
          }
        }));
  }
}
