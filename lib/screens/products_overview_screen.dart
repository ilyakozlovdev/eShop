import 'package:flutter/material.dart';
import '../widgets/image_carousel.dart';
import '../widgets/horizontal_product_list.dart';

class ProducrsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () => null,
          )
        ],
        title: Row(
          children: [
            Icon(Icons.blur_linear),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text('eShop'),
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            child: ImageCarousel(),
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
      ),
    );
  }
}
