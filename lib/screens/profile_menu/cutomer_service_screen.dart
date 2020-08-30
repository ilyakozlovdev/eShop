import 'package:flutter/material.dart';

class CustomerService extends StatelessWidget {
  const CustomerService({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Service'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => ListView.builder(
          itemBuilder: (context, index) => ListTile(
            leading: Icon(Icons.access_alarm),
            title: Text('Customer Service'),
          ),
          itemCount: 1,
        ),
      ),
    );
  }
}
