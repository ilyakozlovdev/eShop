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

    return Scaffold(
      appBar: appBar,
      body: LayoutBuilder(
          builder: (context, constraints) => ListView(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.1,
                      left: MediaQuery.of(context).size.width * 0.1,
                      right: MediaQuery.of(context).size.width * 0.1,
                    ),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Search',
                      ),
                    ),
                  )
                ],
              )),
    );
  }
}
