import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageCarousel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ImageCarousel();
  }
}

class _ImageCarousel extends State<ImageCarousel> {
  // ignore: unused_field
  int _current = 0;
  final List<Map<String, Object>> imgList = [
    {
      'title': 'New Apple MacBook Pro 16',
      'imageUrl':
          'https://icdn2.digitaltrends.com/image/digitaltrends/apple-macbook-pro-16-ry-11.jpg'
    },
    {
      'title': 'Dell XPS 15 - perfect working machine',
      'imageUrl':
          'https://i.gadgets360cdn.com/large/dell_xps_15_9500_image_notebookcheck_dell_france_1588254699768.jpg'
    },
    {
      'title': 'Why 60 Hz is not enough?',
      'imageUrl':
          'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/computer-monitors-index-1573157429.jpg?crop=1.00xw:1.00xh;0,0&resize=1200:*'
    },
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      imgList.forEach((item) {
        precacheImage(NetworkImage(item['imageUrl']), context);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.16),
            blurRadius: 5,
            offset: Offset(0, 1))
      ]),
      child: CarouselSlider(
        items: imgList
            .map((note) => Stack(children: [
                  Container(
                    child: Image.network(
                      note['imageUrl'],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
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
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: Text(
                        note['title'],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ]))
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
