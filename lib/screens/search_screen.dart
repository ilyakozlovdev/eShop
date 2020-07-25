import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
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
    );

    final screenHeight =
        MediaQuery.of(context).size.height - appBar.preferredSize.height - 80;

    return Scaffold(
      appBar: appBar,
      body: ListView(
        children: [
          Row(
            children: [Text('Search')],
          )
        ],
      ),
    );
  }
}
