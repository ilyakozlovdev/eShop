import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => ListView.builder(
          itemBuilder: (context, index) => ListTile(
            leading: Icon(Icons.access_alarm),
            title: Text('Profile'),
          ),
          itemCount: 1,
        ),
      ),
    );
  }
}
