import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_item.dart';

class HorizontalProductList extends StatelessWidget {
  final List<Product> products;
  final String title;

  HorizontalProductList({this.products, this.title});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final availableHeigh = mediaQuery.size.height;

    return Column(
      children: [
        Container(
          width: double.infinity,
          child: Container(
            margin: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 5),
            child: Text(
              title,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: availableHeigh * 0.35,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemCount: products.length,
            itemBuilder: (ctx, idx) => ProductItem(
              id: products[idx].id,
              title: products[idx].title,
              imageUrl: products[idx].imageUrl,
            ),
          ),
        )
      ],
    );
  }
}
