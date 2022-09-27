import 'package:flutter/material.dart';
import 'package:untitled/widgets/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:untitled/model/model.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName), builder: (_) => HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: 'SoFood'),
        bottomNavigationBar: CustomNavBar(),
        body: ListView(
          children: [
            Container(
                child: CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1.5,
                viewportFraction: 0.9,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                initialPage: 2,
                autoPlay: true,
              ),
              items: Categorys.categories
                  .map((category) => HeroCarouselCard(
                        category: category,
                      ))
                  .toList(),
            )),
            SectionTitle(title: 'RECOMMENDED'),
            ProductCarousel(products: Product.products.where((product) => product.isRecommended).toList(),),
            SectionTitle(title: 'POPULAR'),
            ProductCarousel(products: Product.products.where((product) => product.isPopular).toList(),),
          ],
        ));
  }
}
