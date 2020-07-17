import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/horizontal_product_list.dart';

class ProducrsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return ListView(
      children: [
        Container(
          height: mediaQuery.size.height * 0.25,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(blurRadius: 10, color: Colors.black.withOpacity(0.2))
          ]),
          child: Image.network(
            'https://icdn2.digitaltrends.com/image/digitaltrends/apple-macbook-pro-16-ry-11.jpg',
            fit: BoxFit.cover,
          ),
        ),
        HorizontalProductList(
          title: 'For Home',
        ),
        HorizontalProductList(
          title: 'Electronics',
        ),
        HorizontalProductList(
          title: 'Food',
        ),
      ],
    );
  }
}
