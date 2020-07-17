import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final linkStyle = TextStyle(color: Colors.white, fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.blueAccent,
          Colors.blue,
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Login',
              style: linkStyle,
            ),
            Text(
              '/',
              style: linkStyle,
            ),
            Text(
              'Register',
              style: linkStyle,
            )
          ],
        ),
      ),
      Container(
        height: MediaQuery.of(context).size.height * 0.2,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.white12,
          Colors.black12,
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
        child: Column(
          children: [
            Center(
              child: Text('Sign in to get new features'),
            )
          ],
        ),
      )
    ]);
  }
}
