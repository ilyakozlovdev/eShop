import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';
import '../widgets/product_item.dart';

class HorizontalProductList extends StatelessWidget {
  final String title;

  HorizontalProductList({this.title});

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProvider>(context);
    final products = productsData.items;
    print(products);

    final mediaQuery = MediaQuery.of(context);
    final availableHeigh = mediaQuery.size.height;

    return Column(
      children: [
        Container(
          width: double.infinity,
          child: Container(
            margin: EdgeInsets.only(top: 25, left: 15, right: 15, bottom: 10),
            child: Text(
              title,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: availableHeigh * 0.33,
          decoration: BoxDecoration(
              color: Colors.black,
              boxShadow: [BoxShadow(blurRadius: 4, color: Colors.black26)]),
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8),
            itemCount: products.length,
            itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
              value: products[i],
              child: ProductItem(),
            ),
          ),
        )
      ],
    );
  }
}
