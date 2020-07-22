import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
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

    final screenHeigh =
        MediaQuery.of(context).size.height - appBar.preferredSize.height;

    final listTile = ListTile(
      leading: Image.network(
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg'),
      title: Text('Product title'),
      subtitle: Text('\$400'),
      trailing: Container(
        width: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.amber,
                  child: Text(
                    '3',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
            SizedBox(
              width: 6,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 4,
                ),
                GestureDetector(
                  child: Icon(
                    Icons.add,
                    color: Colors.green,
                  ),
                  onTap: () => null,
                ),
                SizedBox(
                  height: 4,
                ),
                GestureDetector(
                  child: Icon(
                    Icons.remove,
                    color: Colors.red,
                  ),
                  onTap: () => null,
                ),
              ],
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: Column(
        children: [
          Container(
            height: screenHeigh * 0.05,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your cart',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: screenHeigh * 0.7,
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      listTile,
                      listTile,
                      listTile,
                      listTile,
                      listTile,
                      listTile,
                      listTile,
                      listTile,
                      listTile,
                      listTile,
                      listTile,
                      listTile,
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: screenHeigh * 0.2 - 80,
            decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(
                      color: Colors.black, style: BorderStyle.solid)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Total',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text('\$1200',
                          style: Theme.of(context).textTheme.headline4)
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
