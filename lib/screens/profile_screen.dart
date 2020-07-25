import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final linkStyle = TextStyle(
      color: Colors.white, fontSize: 16, decoration: TextDecoration.underline);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => ListView(children: [
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
                InkWell(
                  child: Text(
                    'Login',
                    style: linkStyle,
                  ),
                  onTap: () => print('Login'),
                ),
                Text(
                  '/',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                InkWell(
                  child: Text(
                    'Register',
                    style: linkStyle,
                  ),
                  onTap: () => print('Register'),
                ),
              ],
            ),
          ),
          Container(
            height: constraints.maxHeight * 0.25,
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
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Container(
                    width: 24,
                    height: double.infinity,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.person,
                      size: 26,
                    ),
                  ),
                  title: Text('My profile'),
                  subtitle: Text('Personal data, shop data'),
                  onTap: () => null,
                ),
                ListTile(
                  leading: Container(
                      width: 24,
                      height: double.infinity,
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.favorite,
                        size: 26,
                      )),
                  title: Text('Favorites'),
                  subtitle: Text('Products, categories, blogs'),
                  onTap: () => null,
                ),
                ListTile(
                  leading: Container(
                      width: 24,
                      height: double.infinity,
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.message,
                        size: 26,
                      )),
                  title: Text('Messages'),
                  subtitle: Text('0 new messages'),
                  onTap: () => null,
                ),
                ListTile(
                  leading: Container(
                      width: 24,
                      height: double.infinity,
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.local_mall,
                        size: 26,
                      )),
                  title: Text('My orders'),
                  subtitle: Text('Shipped, in progress'),
                  onTap: () => null,
                ),
                ListTile(
                  leading: Container(
                      width: 24,
                      height: double.infinity,
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.headset_mic,
                        size: 26,
                      )),
                  title: Text('Customer service'),
                  subtitle: Text('0 unresolved requests'),
                  onTap: () => null,
                ),
                ListTile(
                  leading: Container(
                      width: 24,
                      height: double.infinity,
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.settings,
                        size: 26,
                      )),
                  title: Text('Settings'),
                  subtitle: Text('Notifications, theme, language'),
                  onTap: () => null,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
