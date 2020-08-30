import 'package:eShop/providers/orders_provider.dart';
import 'package:eShop/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final products = Provider.of<ProductsProvider>(context);

    Widget listTileBuilder(
        {@required String id,
        @required double price,
        @required int quantity,
        @required String imageUrl,
        @required String title}) {
      final product = products.findById(id);

      return Dismissible(
        key: ValueKey(id),
        background: Container(
          color: Theme.of(context).errorColor,
        ),
        direction: DismissDirection.endToStart,
        onDismissed: (_) {
          cart.toggleItem(productId: id);
          product.removeFromCart();
        },
        child: ListTile(
          leading: AspectRatio(
            aspectRatio: 1 / 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(title),
          subtitle: Text('\$$price \nQuantity: $quantity'),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 4,
              ),
              GestureDetector(
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
                onTap: () {
                  cart.incItemQuantity(id);
                },
              ),
              SizedBox(
                height: 4,
              ),
              GestureDetector(
                child: Icon(
                  Icons.remove,
                  color: Colors.black,
                ),
                onTap: () {
                  cart.decItemQuantity(id);
                },
              ),
            ],
          ),
          isThreeLine: true,
          onLongPress: () => null,
        ),
      );
    }

    final thanksSnackBar = SnackBar(
      content: Text('Thank you for your order!'),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          Scaffold.of(context).hideCurrentSnackBar();
        },
      ),
      behavior: SnackBarBehavior.floating,
    );

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(left: 15),
              alignment: Alignment.centerLeft,
              height: constraints.maxHeight * 0.05,
              width: double.infinity,
              child: Text(
                'Cart',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            cart.itemCount <= 0
                ? LimitedBox(
                    maxHeight: constraints.maxHeight * 0.95,
                    child: Center(
                      child:
                          Text('There are no items in cart yet. Add some =)'),
                    ),
                  )
                : Column(
                    children: [
                      LimitedBox(
                        maxHeight: constraints.maxHeight * 0.82,
                        child: ListView.builder(
                          itemBuilder: (context, i) => listTileBuilder(
                            id: cart.items.values.toList()[i].id,
                            price: cart.items.values.toList()[i].price,
                            quantity: cart.items.values.toList()[i].quantity,
                            imageUrl: cart.items.values.toList()[i].imageUrl,
                            title: cart.items.values.toList()[i].title,
                          ),
                          itemCount: cart.itemCount,
                        ),
                      ),
                      Container(
                          height: constraints.maxHeight * 0.08,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              FlatButton(
                                onPressed: () {
                                  Provider.of<OrdersProvider>(context,
                                          listen: false)
                                      .addOrder(
                                          cartProducts:
                                              cart.items.values.toList(),
                                          total: cart.totalAmount);
                                  Scaffold.of(context)
                                      .showSnackBar(thanksSnackBar);
                                  cart.clear();
                                  products.removeAllFromCart();
                                },
                                child: Text(
                                  'Order now',
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption
                                      .copyWith(
                                          decoration: TextDecoration.underline,
                                          fontSize: 16),
                                  textAlign: TextAlign.end,
                                ),
                              )
                            ],
                          )),
                      Container(
                          height: constraints.maxHeight * 0.05,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                Colors.blueAccent,
                                Colors.blue,
                              ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight)),
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      'Total: \$${cart.totalAmount.toStringAsFixed(2)}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4
                                          .copyWith(color: Colors.white),
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
