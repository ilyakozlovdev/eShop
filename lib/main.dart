import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'layouts/main_layout.dart';
import 'screens/product_details_screen.dart';
import './providers/products_provider.dart';
import './providers/cart_provider.dart';

void main() {
  runApp(EShopApp());
}

class EShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => ProductsProvider()),
        ChangeNotifierProvider(create: (ctx) => CartProvider())
      ],
      child: MaterialApp(
        title: 'EShop',
        theme: ThemeData(
          primarySwatch: Colors.amber,
          accentColor: Colors.white,
          fontFamily: 'Lato',
          appBarTheme: AppBarTheme(color: Colors.white),
          textTheme: TextTheme(
              headline5: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Lato',
                  fontSize: 18,
                  fontWeight: FontWeight.w700)),
        ),
        home: HomePage(),
        routes: {
          ProductDetailsScreen.routeName: (ctx) => ProductDetailsScreen()
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainLayout();
  }
}
