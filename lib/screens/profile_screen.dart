import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final linkStyle = TextStyle(color: Colors.white, fontSize: 16);

  @override
  Widget build(BuildContext context) {
    final availableHeight = MediaQuery.of(context).size.height;

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
      ),
      Container(
        height: availableHeight * 0.5,
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
              child: Text(
                'Profile',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            SizedBox(
              height: 10,
              width: double.infinity,
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('My profile'),
              onTap: () => null,
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Favorites'),
              onTap: () => null,
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
              onTap: () => null,
            ),
            ListTile(
              leading: Icon(Icons.local_mall),
              title: Text('My orders'),
              onTap: () => null,
            ),
            ListTile(
              leading: Icon(Icons.headset_mic),
              title: Text('Customer service'),
              onTap: () => null,
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () => null,
            ),
          ],
        ),
      ),
    ]);
  }
}
