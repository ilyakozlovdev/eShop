import 'package:flutter/material.dart';
import 'layouts/main_layout.dart';

void main() {
  runApp(EShopApp());
}

class EShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainLayout();
  }
}
