import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites Screen'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => ListView.builder(
          itemBuilder: (context, index) => ListTile(
            leading: Icon(Icons.access_alarm),
            title: Text('Favorites'),
          ),
          itemCount: 1,
        ),
      ),
    );
  }
}
