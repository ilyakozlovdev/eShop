import 'package:flutter/material.dart';
import '../screens/product_details_screen.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  ProductItem({this.id, this.title, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: GridTile(
          footer: GridTileBar(
            title: Text(
              title,
              textAlign: TextAlign.center,
            ),
            leading:
                IconButton(icon: Icon(Icons.favorite), onPressed: () => null),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () => null,
            ),
            backgroundColor: Colors.black38,
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushNamed(ProductDetailsScreen.routeName, arguments: id);
            },
            child: Image.network(
              imageUrl,
              alignment: Alignment.center,
              fit: BoxFit.cover,
            ),
          )),
    );
  }
}
