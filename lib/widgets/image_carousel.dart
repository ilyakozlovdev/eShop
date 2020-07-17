import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageCarousel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ImageCarousel();
  }
}

class _ImageCarousel extends State<ImageCarousel> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final List imgList = [
      'https://icdn2.digitaltrends.com/image/digitaltrends/apple-macbook-pro-16-ry-11.jpg',
      'https://i.gadgets360cdn.com/large/dell_xps_15_9500_image_notebookcheck_dell_france_1588254699768.jpg',
      'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/computer-monitors-index-1573157429.jpg?crop=1.00xw:1.00xh;0,0&resize=1200:*'
    ];

    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.16),
            blurRadius: 5,
            offset: Offset(0, 1))
      ]),
      child: CarouselSlider(
        items: imgList
            .map((imageUrl) => Container(
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ))
            .toList(),
        options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.0,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
      ),
    );
  }
}
