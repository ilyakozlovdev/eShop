import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';
import '../providers/product_provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  static String routeName = '/product-details';
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final ProductProvider product =
        Provider.of<ProductsProvider>(context, listen: false)
            .findById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => ListView(
          children: [
            Container(
              height: constraints.maxHeight,
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        height: constraints.maxHeight * 0.3,
                        width: double.infinity,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              blurRadius: 6,
                              color: Colors.black.withOpacity(0.2))
                        ]),
                        child: Image.network(
                          product.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        child: Text('Description',
                            style: Theme.of(context).textTheme.headline6),
                      ),
                      Container(
                        width: double.infinity,
                        height: constraints.maxHeight * 0.2,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: ClipRRect(
                          child: ListView(
                            children: [
                              Text(product.description,
                                  style: Theme.of(context).textTheme.bodyText1)
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        child: Text('Price',
                            style: Theme.of(context).textTheme.headline6),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text('\$${product.price}',
                            style: Theme.of(context).textTheme.bodyText1),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: RaisedButton(
                          child: Text('Add to cart'),
                          color: Colors.amber,
                          onPressed: () => null,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: RaisedButton(
                          child: Text(
                            'Mark as favorite',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.pink,
                          onPressed: () => null,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
