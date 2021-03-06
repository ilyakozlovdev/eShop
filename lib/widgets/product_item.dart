import 'package:eShop/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import '../screens/product_details_screen.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductProvider>(context);
    final cart = Provider.of<CartProvider>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: GridTile(
          footer: GridTileBar(
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            ),
            leading: IconButton(
                icon: product.isFavorite
                    ? Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    : Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      ),
                onPressed: () => product.toggleFavoriteStatus()),
            trailing: IconButton(
              icon: product.isInCart
                  ? Icon(
                      Icons.shopping_cart,
                      color: Colors.amberAccent,
                    )
                  : Icon(Icons.add_shopping_cart),
              onPressed: () {
                cart.toggleItem(
                    title: product.title,
                    price: product.price,
                    productId: product.id,
                    imageUrl: product.imageUrl);
                product.toggleInCart();
              },
            ),
          ),
          child: Stack(children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(ProductDetailsScreen.routeName,
                    arguments: product.id);
              },
              child: Image.network(
                product.imageUrl,
                alignment: Alignment.center,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    child: null)),
          ])),
    );
  }
}
