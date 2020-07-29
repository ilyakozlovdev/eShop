import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'layouts/main_layout.dart';
import 'screens/product_details_screen.dart';
import './providers/products_provider.dart';
import './providers/cart_provider.dart';
import './providers/orders_provider.dart';
import './screens/orders_screen.dart';

void main() {
  runApp(EShopApp());
}

class EShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => ProductsProvider()),
        ChangeNotifierProvider(create: (ctx) => CartProvider()),
        ChangeNotifierProvider(create: (ctx) => OrdersProvider())
      ],
      child: MaterialApp(
        title: 'EShop',
        theme: ThemeData(
          primarySwatch: Colors.amber,
          accentColor: Colors.white,
          fontFamily: 'Lato',
          appBarTheme: AppBarTheme(color: Colors.white),
          textTheme: TextTheme(
              headline4: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Lato',
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
              headline5: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Lato',
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
              headline6: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Lato',
                  fontSize: 18,
                  fontWeight: FontWeight.w500)),
        ),
        home: HomePage(),
        routes: {
          ProductDetailsScreen.routeName: (ctx) => ProductDetailsScreen(),
          OrdersScreen.routeName: (ctx) => OrdersScreen(),
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
