import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../widgets/image_carousel.dart';
import '../widgets/horizontal_product_list.dart';

class ProducrsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return ListView(
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
    );
  }
}
