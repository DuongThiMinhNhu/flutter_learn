import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/widgets/widgets.dart';
import 'package:untitled/model/model.dart';
import 'package:untitled/blocs/wishlist/wishlist_bloc.dart';
import 'package:untitled/blocs/cart/cart_bloc.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = '/product';
  static Route route({required Productt product}) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => ProductScreen(product: product),
    );
  }

  final Productt product;
  ProductScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: product.name,
      ),
      bottomNavigationBar: CustomNavBar(screen: routeName,productt: product,),
      body: ListView(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 1.5,
              viewportFraction: 0.9,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
            ),
            items: [
              HeroCarouselCard(
                product: product,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  alignment: Alignment.bottomCenter,
                  color: Colors.black.withAlpha(50),
                ),
                Container(
                    margin: EdgeInsets.all(5.0),
                    width: MediaQuery.of(context).size.width - 10,
                    height: 50,
                    color: Colors.black,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product.name,
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: Colors.white),
                          ),
                          Text(
                            '${product.price}',
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                'Product Information',
                style: Theme.of(context).textTheme.headline3,
              ),
              children: [
                ListTile(
                  title: Text(
                      'A smoothie is just a drink made from fresh fruits by pureeing with a few teaspoons of sweetened condensed milk, crushed ice and fresh fruit. Smoothies are a nutritious drink rich in vitamins that'
                      ' are good for health.',
                      style: Theme.of(context).textTheme.bodyText1),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                'Delivery Information',
                style: Theme.of(context).textTheme.headline3,
              ),
              children: [
                ListTile(
                  title: Text(
                      'A smoothie is just a drink made from fresh fruits by pureeing with a few teaspoons of sweetened condensed milk, crushed ice and fresh fruit. Smoothies are a nutritious drink rich in vitamins that'
                      ' are good for health.',
                      style: Theme.of(context).textTheme.bodyText1),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
