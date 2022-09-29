import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/blocs/cart/cart_bloc.dart';
import 'package:untitled/blocs/category/category_bloc.dart';
import 'package:untitled/blocs/checkout/checkout_bloc.dart';
import 'package:untitled/blocs/wishlist/wishlist_bloc.dart';
import 'package:untitled/blocs/product/product_bloc.dart';
import 'package:untitled/repositories/category/category_repository.dart';
import 'package:untitled/repositories/checkout/checkout_repository.dart';
import 'package:untitled/repositories/product/product_repository.dart';
import 'screens/screens.dart';
import 'config/config.dart';
import 'package:untitled/simple_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => WishlistBloc()..add(StartWishlist())),
          BlocProvider(create: (_) => CartBloc()..add(CartStarted())),
          BlocProvider(
            create: (context) => CheckoutBloc(
              cartBloc: context.read<CartBloc>(),
              checkoutRepository: CheckoutRepository(),
            ),
          ),
          BlocProvider(
            create: (_) => CategoryBloc(
              categoryRepository: CategoryRepository(),
            )..add(
                LoadCategories(),
              ),
          ),
          BlocProvider(
            create: (_) => ProductBloc(
              productRepository: ProductRepository(),
            )..add(
                LoadProducts(),
              ),
          ),
        ],
        child: MaterialApp(
          title: 'Zero To Unicorn',
          theme: theme(),
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: SplashScreen.routeName,
          debugShowCheckedModeBanner: false,
        ));
  }
}
